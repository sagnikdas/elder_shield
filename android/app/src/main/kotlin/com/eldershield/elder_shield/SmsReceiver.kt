package com.eldershield.elder_shield

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.os.VibrationEffect
import android.os.Vibrator
import android.provider.Settings
import android.provider.Telephony
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat

/**
 * BroadcastReceiver for incoming SMS messages.
 * When Flutter is listening and the app is visible: forwards to SmsEventEmitter → EventChannel.
 * When the app is backgrounded or killed: runs a lightweight risk check and, if high risk,
 * interrupts with a full-screen notification plus an overlay fallback if permitted.
 */
class SmsReceiver : BroadcastReceiver() {

    private val tag = "SmsReceiver"

    companion object {
        const val EXTRA_SMS_SENDER = "elder_shield_sms_sender"
        const val EXTRA_SMS_BODY = "elder_shield_sms_body"
        const val EXTRA_SMS_TIMESTAMP = "elder_shield_sms_timestamp"
        private const val CHANNEL_ID = "elder_shield_alerts"
        private const val CHANNEL_NAME = "Scam Alerts"
        /** Delay (ms) before re-posting so the notification stays in heads-up preview longer. */
        private const val HEADS_UP_REPOST_DELAY_MS = 5_000L
        private const val HEADS_UP_REPOST_DELAY_MS_2 = 10_000L

        private val handler = Handler(Looper.getMainLooper())
    }

    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != Telephony.Sms.Intents.SMS_RECEIVED_ACTION) return

        val messages = Telephony.Sms.Intents.getMessagesFromIntent(intent)
        if (messages.isNullOrEmpty()) return

        val grouped = mutableMapOf<String, StringBuilder>()
        var timestamp = System.currentTimeMillis()

        for (msg in messages) {
            val sender = msg.originatingAddress ?: "unknown"
            grouped.getOrPut(sender) { StringBuilder() }.append(msg.messageBody)
            if (msg.timestampMillis > 0) timestamp = msg.timestampMillis
        }

        for ((sender, bodyBuilder) in grouped) {
            val body = bodyBuilder.toString()
            val sinkActive = SmsEventEmitter.sink != null
            val appVisible = MainActivity.isAppVisible
            Log.d(tag, "Received SMS from $sender (${body.length} chars) sinkActive=$sinkActive appVisible=$appVisible")

            if (sinkActive) {
                SmsEventEmitter.sendSms(sender = sender, body = body, timestamp = timestamp)
            }

            val shouldInterruptNatively = !appVisible
            if (!shouldInterruptNatively) continue

            val trustedSenders = try {
                context.getSharedPreferences("elder_shield_prefs", android.content.Context.MODE_PRIVATE)
                    .getStringSet("trusted_senders", emptySet()) ?: emptySet()
            } catch (e: Exception) {
                emptySet<String>()
            }
            val highRisk = SimpleRiskCheck.looksHighRisk(sender, body, trustedSenders)
            Log.d(tag, "Background/killed app: looksHighRisk=$highRisk")
            if (highRisk) {
                Log.d(tag, "Showing possible-scam notification and overlay")
                showHighRiskNotification(context, sender, body, timestamp)
                maybeShowOverlay(context, sender, body, timestamp)
                vibrateStrongly(context)
            }
        }
    }

    private fun showHighRiskNotification(
        context: Context,
        sender: String,
        body: String,
        timestamp: Long
    ) {
        createChannelIfNeeded(context)

        val openIntent = Intent(context, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
            putExtra(EXTRA_SMS_SENDER, sender)
            putExtra(EXTRA_SMS_BODY, body)
            putExtra(EXTRA_SMS_TIMESTAMP, timestamp)
        }
        val pending = PendingIntent.getActivity(
            context,
            timestamp.toInt().and(0x7FFFFFFF),
            openIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val bodyShort = if (body.length > 60) body.take(60) + "…" else body
        val iconId = context.applicationInfo.icon
        val notification = NotificationCompat.Builder(context, CHANNEL_ID)
            .setSmallIcon(if (iconId != 0) iconId else android.R.drawable.ic_dialog_alert)
            .setContentTitle("Elder Shield: Possible scam message")
            .setContentText("From $sender — $bodyShort. Tap to see details.")
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setCategory(NotificationCompat.CATEGORY_ALARM)
            .setContentIntent(pending)
            .setFullScreenIntent(pending, true)
            .setAutoCancel(true)
            .build()

        try {
            val notificationId = timestamp.toInt().and(0x7FFFFFFF)
            NotificationManagerCompat.from(context).notify(notificationId, notification)
            Log.d(tag, "Notification posted successfully")
            // Re-post after delays so it stays in heads-up preview longer than the SMS, then shrinks to the list.
            val appContext = context.applicationContext
            handler.postDelayed({
                try {
                    showHighRiskNotificationRepost(appContext, sender, bodyShort, timestamp, pending, iconId)
                } catch (e: Exception) {
                    Log.e(tag, "Heads-up repost 1 failed", e)
                }
            }, HEADS_UP_REPOST_DELAY_MS)
            handler.postDelayed({
                try {
                    showHighRiskNotificationRepost(appContext, sender, bodyShort, timestamp, pending, iconId)
                } catch (e: Exception) {
                    Log.e(tag, "Heads-up repost 2 failed", e)
                }
            }, HEADS_UP_REPOST_DELAY_MS_2)
        } catch (e: SecurityException) {
            Log.e(tag, "Cannot show notification (permission?)", e)
        } catch (e: Exception) {
            Log.e(tag, "Failed to show notification", e)
        }
    }

    /**
     * Re-posts the same notification with setOnlyAlertOnce(false) so the system
     * re-triggers heads-up (preview), keeping it visible longer than the SMS notification.
     */
    private fun showHighRiskNotificationRepost(
        context: Context,
        sender: String,
        bodyShort: String,
        timestamp: Long,
        pending: PendingIntent,
        iconId: Int
    ) {
        val notification = NotificationCompat.Builder(context, CHANNEL_ID)
            .setSmallIcon(if (iconId != 0) iconId else android.R.drawable.ic_dialog_alert)
            .setContentTitle("Elder Shield: Possible scam message")
            .setContentText("From $sender — $bodyShort. Tap to see details.")
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setCategory(NotificationCompat.CATEGORY_ALARM)
            .setContentIntent(pending)
            .setAutoCancel(true)
            .setOnlyAlertOnce(false) // Re-trigger heads-up so preview stays longer
            .build()
        try {
            NotificationManagerCompat.from(context).notify(
                timestamp.toInt().and(0x7FFFFFFF),
                notification
            )
        } catch (e: Exception) {
            throw e
        }
    }

    private fun createChannelIfNeeded(context: Context) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        val channel = NotificationChannel(
            CHANNEL_ID,
            CHANNEL_NAME,
            NotificationManager.IMPORTANCE_HIGH
        ).apply {
            description = "Warnings about suspicious messages"
            setShowBadge(true)
        }
        (context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager)
            .createNotificationChannel(channel)
    }

    private fun maybeShowOverlay(
        context: Context,
        sender: String,
        body: String,
        timestamp: Long
    ) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M &&
            !Settings.canDrawOverlays(context)
        ) {
            return
        }
        try {
            ScamOverlayService.show(context.applicationContext, sender, body, timestamp)
        } catch (e: Exception) {
            Log.e(tag, "Failed to start overlay service", e)
        }
    }

    private fun vibrateStrongly(context: Context) {
        try {
            val vibrator = context.getSystemService(Context.VIBRATOR_SERVICE) as? Vibrator ?: return
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                vibrator.vibrate(
                    VibrationEffect.createWaveform(
                        longArrayOf(0, 500, 200, 500, 200, 700),
                        intArrayOf(0, 255, 0, 255, 0, 255),
                        -1
                    )
                )
            } else {
                @Suppress("DEPRECATION")
                vibrator.vibrate(longArrayOf(0, 500, 200, 500, 200, 700), -1)
            }
        } catch (e: Exception) {
            Log.e(tag, "Failed to vibrate strongly", e)
        }
    }
}
