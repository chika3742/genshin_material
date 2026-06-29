import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
    func didInitializeImplicitFlutterEngine(_ engineBridge: any FlutterImplicitEngineBridge) {
        GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
        
        HoyolabIntegrationApiSetup.setUp(binaryMessenger: engineBridge.applicationRegistrar.messenger(), api: HoyolabIntegrationApiImplementation())
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
