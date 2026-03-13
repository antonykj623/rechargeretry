package com.mysaveapp.rechargeretry.recharge_retry

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.app.Activity
import android.provider.MediaStore

import java.io.File

class MainActivity: FlutterActivity() {

    private val PREF_CHANNEL = "native_prefs"
    private val URL_CHANNEL = "native_url_launcher"
    private val CROP_CHANNEL = "native_crop"

    private val PICK_IMAGE = 1001

    private var cropResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        /// ---------------- PREFS CHANNEL ----------------
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            PREF_CHANNEL
        ).setMethodCallHandler { call, result ->

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

        /// ---------------- URL LAUNCHER ----------------
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

        /// ---------------- IMAGE PICK + CROP ----------------
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CROP_CHANNEL
        ).setMethodCallHandler { call, result ->

            if (call.method == "pickImage") {

                cropResult = result

                val intent = Intent(Intent.ACTION_PICK)
                intent.type = "image/*"

                startActivityForResult(intent, PICK_IMAGE)

            } else {
                result.notImplemented()
            }

        }

    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {

        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == PICK_IMAGE && resultCode == Activity.RESULT_OK && data != null) {

            val sourceUri = data.data



            if (sourceUri != null) {


                val filePath = getRealPathFromURI(this, sourceUri)

                cropResult?.success(filePath.toString())

            }

        }




    }


    fun getRealPathFromURI(context: Context, uri: Uri): String? {
        var result: String? = null

        val projection = arrayOf(MediaStore.Images.Media.DATA)
        val cursor = context.contentResolver.query(uri, projection, null, null, null)

        if (cursor != null) {
            val columnIndex = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATA)
            cursor.moveToFirst()
            result = cursor.getString(columnIndex)
            cursor.close()
        }

        if (result == null) {
            result = uri.path
        }

        return result
    }

}