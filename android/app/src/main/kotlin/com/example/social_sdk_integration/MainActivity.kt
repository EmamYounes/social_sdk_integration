package com.example.social_sdk_integration

import android.content.Intent
import androidx.annotation.NonNull
import com.example.social_sdk_integration.zoom.ui.InitAuthSDKActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterActivity() {

    private val CHANNEL = "flutter.native/zoom"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        MethodChannel(flutterEngine.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "openZoom") {
                val intent = Intent(this, InitAuthSDKActivity::class.java)
                startActivity(intent)

            }
        }



    }



}
