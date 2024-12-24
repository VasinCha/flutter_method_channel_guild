package com.example.flutter_method_channel_guild

import android.content.Intent
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    companion object {
      var flutterParam: String? = null
    }
    private val CHANNEL = "native_module"
  
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
      super.configureFlutterEngine(flutterEngine)
      MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
        call, result ->
        // This method is invoked on the main thread.
        if (call.method == "openNativeView") {

          if (call.arguments != null) {
            println("call.arguments ${call.arguments}")
            val args = call.arguments as HashMap<String, String?>
            var param = args["flutterParam"]
            println(".......flutterParam: $param")

            flutterParam = param!!
          }

          val intent = Intent(this, HomeActivity::class.java)
          startActivity(intent)
        } else {
            println("EKYC not call method")
        }
      }
    }
}
