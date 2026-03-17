package com.eldershield.elder_shield

import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.Settings
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

/**
 * Registers the fraud_guard/events EventChannel and the elder_shield/launch MethodChannel.
 * When the app is opened from a high-risk SMS notification (app was killed), Flutter
 * calls getLaunchSms to get the message and show the warning sheet.
 */
class MainActivity : FlutterActivity() {

    companion object {
        private const val EVENT_CHANNEL = "fraud_guard/events"
        private const val LAUNCH_CHANNEL = "elder_shield/launch"
        private const val SYSTEM_CHANNEL = "elder_shield/system"
        private const val WHITELIST_CHANNEL = "elder_shield/whitelist"
        private const val TAG = "MainActivity"

        @Volatile
        var isAppVisible: Boolean = false
    }

    private var callStateListener: CallStateListener? = null
    private var eventChannel: EventChannel? = null

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
    }

    override fun onResume() {
        super.onResume()
        isAppVisible = true
    }

    override fun onPause() {
        isAppVisible = false
        super.onPause()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            LAUNCH_CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getLaunchSms") {
                val i = intent ?: return@setMethodCallHandler result.success(null)
                val sender = i.getStringExtra(SmsReceiver.EXTRA_SMS_SENDER)
                val body = i.getStringExtra(SmsReceiver.EXTRA_SMS_BODY)
                val timestamp = i.getLongExtra(SmsReceiver.EXTRA_SMS_TIMESTAMP, 0L)
                if (sender != null && body != null && timestamp != 0L) {
                    result.success(mapOf(
                        "sender" to sender,
                        "body" to body,
                        "timestamp" to timestamp
                    ))
                    setIntent(Intent())
                } else {
                    result.success(null)
                }
            } else {
                result.notImplemented()
            }
        }

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            SYSTEM_CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "canDrawOverlays" -> {
                    result.success(
                        Build.VERSION.SDK_INT < Build.VERSION_CODES.M ||
                            Settings.canDrawOverlays(this)
                    )
                }

                "openOverlayPermissionSettings" -> {
                    try {
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                            val intent = Intent(
                                Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                                Uri.parse("package:$packageName")
                            ).apply {
                                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                            }
                            startActivity(intent)
                        }
                        result.success(null)
                    } catch (e: Exception) {
                        result.error("overlay_settings", e.message, null)
                    }
                }

                else -> result.notImplemented()
            }
        }

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            WHITELIST_CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "setWhitelist") {
                @Suppress("UNCHECKED_CAST")
                val senders = (call.arguments as? List<*>)
                    ?.filterIsInstance<String>()
                    ?.toSet()
                    ?: emptySet()
                getSharedPreferences("elder_shield_prefs", MODE_PRIVATE)
                    .edit()
                    .putStringSet("trusted_senders", senders)
                    .apply()
                Log.d(TAG, "Whitelist updated: ${senders.size} sender(s)")
                result.success(null)
            } else {
                result.notImplemented()
            }
        }

        eventChannel = EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            EVENT_CHANNEL
        ).also { channel ->
            channel.setStreamHandler(object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
                    try {
                        SmsEventEmitter.sink = events
                        // Start call listener once Flutter is ready to receive events.
                        callStateListener =
                            CallStateListener(applicationContext).also { it.start() }
                        Log.d(TAG, "EventChannel onListen: native listeners started")
                    } catch (se: SecurityException) {
                        Log.e(TAG, "SecurityException in onListen", se)
                        SmsEventEmitter.sink = null
                        callStateListener?.stop()
                        callStateListener = null
                        events.error(
                            "security",
                            se.message ?: "SecurityException starting native listeners",
                            null
                        )
                    } catch (e: Exception) {
                        Log.e(TAG, "Unexpected error in onListen", e)
                        SmsEventEmitter.sink = null
                        callStateListener?.stop()
                        callStateListener = null
                        events.error(
                            "error",
                            e.message ?: "Unexpected error starting native listeners",
                            null
                        )
                    }
                }

                override fun onCancel(arguments: Any?) {
                    SmsEventEmitter.sink = null
                    callStateListener?.stop()
                    callStateListener = null
                }
            })
        }
    }

    override fun onDestroy() {
        isAppVisible = false
        callStateListener?.stop()
        SmsEventEmitter.sink = null
        eventChannel?.setStreamHandler(null)
        super.onDestroy()
    }
}
