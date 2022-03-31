package com.florxy.florxy

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
//import io.flutter.plugins.GeneratedPluginRegistrant
import com.google.firebase.FirebaseApp
import com.google.firebase.appcheck.FirebaseAppCheck
import com.google.firebase.appcheck.debug.DebugAppCheckProviderFactory

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?){
//        GeneratedPluginRegistrant.registerWith(this)
        FirebaseApp.initializeApp(/*context=*/this)
        val firebaseAppCheck = FirebaseAppCheck.getInstance()
        firebaseAppCheck.installAppCheckProviderFactory(
                DebugAppCheckProviderFactory.getInstance()
        )
        super.onCreate(savedInstanceState)

    }
}
