package com.eldershield.elder_shield

import android.os.Handler
import android.os.Looper
import android.util.Log
import io.flutter.plugin.common.EventChannel

/**
 * Singleton sink that holds the active EventChannel.EventSink.
 * Both SmsReceiver and CallStateListener write events here.
 * Thread-safe: emit() always marshals onto the main thread before calling sink.success().
 */
object SmsEventEmitter {

    private const val TAG = "SmsEventEmitter"

    @Volatile
    var sink: EventChannel.EventSink? = null

    private val mainHandler = Handler(Looper.getMainLooper())

    /** Send an SMS event map to Flutter. */
    fun sendSms(sender: String, body: String, timestamp: Long) {
        val event = mapOf(
            "type" to "sms",
            "sender" to sender,
            "body" to body,
            "timestamp" to timestamp
        )
        Log.d(TAG, "SMS event → sender=$sender ts=$timestamp body=${body.take(60)}")
        emit(event)
    }

    /** Send a call-state event map to Flutter. */
    fun sendCallState(state: String, number: String) {
        val event = mapOf(
            "type" to "call_state",
            "state" to state,
            "number" to number
        )
        Log.d(TAG, "Call event → state=$state number=$number")
        emit(event)
    }

    private fun emit(event: Map<String, Any>) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            sink?.success(event) ?: Log.w(TAG, "No active sink — event dropped: $event")
        } else {
            mainHandler.post {
                sink?.success(event) ?: Log.w(TAG, "No active sink — event dropped: $event")
            }
        }
    }
}
