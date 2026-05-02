import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
    func didInitializeImplicitFlutterEngine(_ engineBridge: any FlutterImplicitEngineBridge) {
        GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
        
        HoyolabIntegrationApiSetup.setUp(binaryMessenger: engineBridge.applicationRegistrar.messenger(), api: HoyolabIntegrationApiImplementation())
    }
}
