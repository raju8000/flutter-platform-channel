import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      if let controller = window?.rootViewController as? FlutterViewController {
                  let channel = FlutterMethodChannel(
                      name: "devBlog.platform.com",
                      binaryMessenger: controller.binaryMessenger
                  )
                  channel.setMethodCallHandler({ (call: FlutterMethodCall, result: FlutterResult) in
                      if call.method == "getOSName" {
                          result("iOS " + UIDevice.current.systemVersion)
                      } else {
                          result(FlutterMethodNotImplemented)
                      }
                  })
              }
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
