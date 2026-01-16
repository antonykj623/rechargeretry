package com.mysaveapp.rechargeretry.recharge_retry

import io.flutter.embedding.android.FlutterActivity
import android.content.Intent
import android.net.Uri
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import android.content.Context
class MainActivity: FlutterActivity(){
    private val PREF_CHANNEL = "native_prefs"
    private val URL_CHANNEL = "native_url_launcher"
    private val CHANNEL = "native_prefs"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        super.configureFlutterEngine(flutterEngine)

        // 🔹 Existing prefs channel (UNCHANGED)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            PREF_CHANNEL
        ).setMethodCallHandler { call, result ->
            result.notImplemented()
        }

        // 🔹 NEW URL LAUNCHER CHANNEL
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            URL_CHANNEL
        ).setMethodCallHandler { call, result ->

            if (call.method == "openUrl") {
                val url = call.argument<String>("url")

                if (url.isNullOrEmpty()) {
                    result.error("INVALID_URL", "URL is null", null)
                    return@setMethodCallHandler
                }

                try {
                    val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    startActivity(intent)
                    result.success(true)
                } catch (e: Exception) {
                    result.error("OPEN_FAILED", e.message, null)
                }

            } else {
                result.notImplemented()
            }
        }


        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                val prefs = getSharedPreferences("MyPrefs", Context.MODE_PRIVATE)

                when (call.method) {
                    "save" -> {
                        val key = call.argument<String>("key")!!
                        val value = call.argument<String>("value")!!
                        prefs.edit().putString(key, value).apply()
                        result.success(true)
                    }

                    "get" -> {
                        val key = call.argument<String>("key")!!
                        val value = prefs.getString(key, null)
                        result.success(value)
                    }

                    else -> result.notImplemented()
                }
            }

    }
}
