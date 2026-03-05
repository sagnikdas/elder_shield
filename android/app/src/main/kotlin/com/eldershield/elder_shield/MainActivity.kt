package com.eldershield.elder_shield

import android.content.Intent
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
        private const val TAG = "MainActivity"
    }

    private var callStateListener: CallStateListener? = null
    private var eventChannel: EventChannel? = null

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
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
        callStateListener?.stop()
        SmsEventEmitter.sink = null
        eventChannel?.setStreamHandler(null)
        super.onDestroy()
    }
}
