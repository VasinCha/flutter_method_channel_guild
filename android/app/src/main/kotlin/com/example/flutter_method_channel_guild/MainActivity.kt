package com.example.flutter_method_channel_guild

import android.content.Intent
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "samples.flutter.native_screen"
  
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
      super.configureFlutterEngine(flutterEngine)
      MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
        call, result ->
        // This method is invoked on the main thread.
        if (call.method == "native_screen") {
            println("call method")
            val intent = Intent(this, MainActivity::class.java)
            startActivity(intent)
        } else {
            println("EKYC not call method")
        }
      }
    }
}
