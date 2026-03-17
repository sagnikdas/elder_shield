package com.eldershield.elder_shield

import android.annotation.SuppressLint
import android.content.Context
import android.os.Build
import android.telephony.PhoneStateListener
import android.telephony.TelephonyCallback
import android.telephony.TelephonyManager
import android.util.Log
import androidx.annotation.RequiresApi
import java.util.concurrent.Executors

/**
 * Listens for phone call state changes and reports IDLE / RINGING / OFFHOOK
 * states to [SmsEventEmitter].
 *
 * On API 31+ (Android 12) uses [TelephonyCallback] — the modern, non-deprecated
 * path. On older devices falls back to [PhoneStateListener].
 *
 * Note: [TelephonyCallback.CallStateListener.onCallStateChanged] no longer
 * receives a phone number (removed by Android for privacy). The number field is
 * sent as an empty string on API 31+; the Dart-side detection logic does not
 * use it.
 */
class CallStateListener(private val context: Context) {

    private val tag = "CallStateListener"
    private var telephonyManager: TelephonyManager? = null

    // ── API 31+ path ────────────────────────────────────────────────────────

    @RequiresApi(Build.VERSION_CODES.S)
    private inner class ModernCallback : TelephonyCallback(),
        TelephonyCallback.CallStateListener {

        override fun onCallStateChanged(state: Int) {
            val stateStr = stateString(state)
            Log.d(tag, "Call state (TelephonyCallback) → $stateStr")
            SmsEventEmitter.sendCallState(state = stateStr, number = "")
        }
    }

    private var modernCallback: Any? = null // typed as Any to avoid @RequiresApi on the field

    // ── Legacy path (API < 31) ───────────────────────────────────────────────

    @Suppress("DEPRECATION")
    private val legacyListener = object : PhoneStateListener() {
        @SuppressLint("MissingPermission")
        override fun onCallStateChanged(state: Int, phoneNumber: String?) {
            val stateStr = stateString(state)
            Log.d(tag, "Call state (PhoneStateListener) → $stateStr  number=${phoneNumber ?: ""}")
            SmsEventEmitter.sendCallState(state = stateStr, number = phoneNumber ?: "")
        }
    }

    // ── Common ───────────────────────────────────────────────────────────────

    private fun stateString(state: Int) = when (state) {
        TelephonyManager.CALL_STATE_IDLE -> "IDLE"
        TelephonyManager.CALL_STATE_RINGING -> "RINGING"
        TelephonyManager.CALL_STATE_OFFHOOK -> "OFFHOOK"
        else -> "UNKNOWN"
    }

    fun start() {
        val tm = context.getSystemService(Context.TELEPHONY_SERVICE) as? TelephonyManager
            ?: return
        telephonyManager = tm

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            val cb = ModernCallback()
            modernCallback = cb
            tm.registerTelephonyCallback(Executors.newSingleThreadExecutor(), cb)
            Log.d(tag, "CallStateListener started (TelephonyCallback)")
        } else {
            @Suppress("DEPRECATION")
            tm.listen(legacyListener, PhoneStateListener.LISTEN_CALL_STATE)
            Log.d(tag, "CallStateListener started (PhoneStateListener)")
        }
    }

    fun stop() {
        val tm = telephonyManager ?: return

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            (modernCallback as? ModernCallback)?.let { tm.unregisterTelephonyCallback(it) }
            modernCallback = null
        } else {
            @Suppress("DEPRECATION")
            tm.listen(legacyListener, PhoneStateListener.LISTEN_NONE)
        }

        telephonyManager = null
        Log.d(tag, "CallStateListener stopped")
    }
}
