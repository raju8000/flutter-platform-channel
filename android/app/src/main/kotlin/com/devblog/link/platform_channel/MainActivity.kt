package com.devblog.link.platform_channel


import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import android.os.Build;
import androidx.annotation.NonNull

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "devBlog.platform.com"
    private lateinit var result:MethodChannel.Result

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getOSName") {
                val name = getOsName()
                result.success(name)
            }
        }
    }

    private fun getOsName(): String {
        return "Android " + Build.VERSION.RELEASE
    }
}
