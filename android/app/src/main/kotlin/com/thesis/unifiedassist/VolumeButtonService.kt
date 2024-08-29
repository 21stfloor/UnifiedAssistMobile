package com.thesis.unifiedassist

import android.app.Service
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.media.AudioManager
import android.media.MediaPlayer
import android.os.IBinder
import android.os.PowerManager
import android.util.Log

class VolumeButtonService : Service() {

    private val TAG = "VolumeButtonService"
    private lateinit var vReceiver: BroadcastReceiver
    private var mediaPlayer: MediaPlayer? = null

    override fun onCreate() {
        super.onCreate()
        Log.d(TAG, "onCreate")
        // Register BroadcastReceiver for volume button events
        vReceiver = object : BroadcastReceiver() {
            override fun onReceive(context: Context?, intent: Intent?) {
                if (intent?.action == "android.media.VOLUME_CHANGED_ACTION") {
                    // Your code here
//                    Log.d(TAG, "Volume button pressed")
                    MainActivity.channel?.invokeMethod("someNativeFunction", null)
                }
            }
        }

        registerReceiver(vReceiver, IntentFilter("android.media.VOLUME_CHANGED_ACTION"))

        // Register receivers to handle screen on/off actions
        val screenOffReceiver = ScreenOffReceiver()
        val screenOnOffFilter = IntentFilter(Intent.ACTION_SCREEN_OFF)
        screenOnOffFilter.addAction(Intent.ACTION_SCREEN_ON)
        registerReceiver(screenOffReceiver, screenOnOffFilter)
    }

    override fun onDestroy() {
        super.onDestroy()
        unregisterReceiver(vReceiver)
        stopSilentSound()
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    private fun playSilentSound() {
        // Initialize MediaPlayer with silent audio
        if (mediaPlayer == null) {
            mediaPlayer = MediaPlayer.create(this, R.raw.silent)
            mediaPlayer?.setVolume(0f, 0f)
            mediaPlayer?.isLooping = true
        }

        mediaPlayer?.start()
    }

    private fun stopSilentSound() {
        mediaPlayer?.stop()
        mediaPlayer?.release()
        mediaPlayer = null
    }

    inner class ScreenOffReceiver : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            when (intent?.action) {
                Intent.ACTION_SCREEN_OFF -> {
                    playSilentSound()
                    Log.d(TAG, "screen off")
                }
                Intent.ACTION_SCREEN_ON -> {
                    stopSilentSound()
                    Log.d(TAG, "screen on")
                }
            }
        }
    }
}
