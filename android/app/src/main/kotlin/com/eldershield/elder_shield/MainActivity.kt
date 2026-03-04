package com.eldershield.elder_shield

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

/**
 * Registers the fraud_guard/events EventChannel and starts the
 * CallStateListener. SmsReceiver fires independently via the manifest.
 */
class MainActivity : FlutterActivity() {

    companion object {
        private const val EVENT_CHANNEL = "fraud_guard/events"
        private const val TAG = "MainActivity"
    }

    private var callStateListener: CallStateListener? = null
    private var eventChannel: EventChannel? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

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
