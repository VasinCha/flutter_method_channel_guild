import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // initial viewcontroller for flutter to use
    let controller = window?.rootViewController as! FlutterViewController

    // create channel that matched with flutter side
    // can have multiple channel depend on module or grouping
    let channel = FlutterMethodChannel(name: "native_module", binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler ({
      (call: FlutterMethodCall, result:@escaping FlutterResult) in
          switch call.method {
            // match case with invoke name on flutter side
            // can have multiple case based on functional in module or grouping
          case "openNativeView":
                  print("call arguments not null")
                  if(call.arguments != nil){
                    let args = call.arguments as! [String: Any]
                    // open view
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "nativeMainVC")
                      SingletonParamSender.shared.flutterParam = args["flutterParam"] as! String
                    
                    vc.modalPresentationStyle = .fullScreen
                    controller.present(vc, animated: true)
                  }
          default:
              result(FlutterMethodNotImplemented)
              }
    })

    // example for multiple channel
    let channel2 = FlutterMethodChannel(name: "etc_module", binaryMessenger: controller.binaryMessenger)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
