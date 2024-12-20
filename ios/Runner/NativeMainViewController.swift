//
//  NativeMainViewController.swift
//  Runner
//
//  Created by Visaruth Chaimanee on 20/12/2567 BE.
//

import Foundation
import UIKit
import Flutter

class NativeMainViewController : UIViewController {
    var paramFromFlutter: String?
    
    @IBOutlet weak var displayTextField: UITextField!
    
    @IBOutlet weak var closeNativeButton: UIButton!
    
    override func viewDidLoad() {
        displayTextField.text = SingletonParamSender.shared.flutterParam
    }
    
    
    @IBAction func popNativeView(_ sender: Any) {
        let result = ["resultCode": "200", "resultMessage":"Native Success!!!"]
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let controller = appDelegate.window!.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "native_module", binaryMessenger: controller.binaryMessenger)
        channel.invokeMethod("nativeResponse", arguments: result)
        // send response back to flutter by invoke arguments
        self.dismiss(animated: true)
    }
}
