package net.chikach.genshinmaterial

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        HoyolabIntegrationApi.setUp(flutterEngine.dartExecutor.binaryMessenger, HoyolabIntegrationApiImpl())
    }
}
