package com.thesis.unifiedassist

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.thesis.unifiedassist/startService"
    private val CHANNEL_SOS = "com.thesis.unifiedassist/sendSOS"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger!!, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "startVolumeButtonService") {
                startService(Intent(this, VolumeButtonService::class.java))
                result.success("Service Started")
            } else {
                result.notImplemented()
            }
        }

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_SOS)
    }

    companion object {
        var channel: MethodChannel? = null
    }


}
