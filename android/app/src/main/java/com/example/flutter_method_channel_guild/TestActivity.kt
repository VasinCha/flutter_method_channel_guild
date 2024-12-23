package com.example.flutter_method_channel_guild

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.example.flutter_method_channel_guild.databinding.ActivityTestBinding

class TestActivity : AppCompatActivity() {

    private lateinit var binding: ActivityTestBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityTestBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}