//
//  AdSupportViewController.swift
//  iOS-Frameworks
//
//  Created by hzyuxiaohua on 8/19/16.
//  Copyright © 2016 hzyuxiaohua. All rights reserved.
//

import UIKit
import AdSupport

class AdSupportViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let manager = ASIdentifierManager.shared()!
        if manager.isAdvertisingTrackingEnabled {
            self.textView.text = manager.advertisingIdentifier.uuidString
        }
        else {
            self.textView.text = "AdvertisingTrackingDisabled"
        }
        
    }

}
