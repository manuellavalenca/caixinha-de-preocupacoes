//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by Manuella Valença on 25/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import UIKit
import Social

//If you want your own UI design, then you can inherit UIViewController instead of SLComposeServiceViewController in ShareViewController.swift file.
class ShareViewController: SLComposeServiceViewController {
    private var textString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func isContentValid() -> Bool {
        if textString != nil {
            return true
        } else {
            return false
        }
    }
    
    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
        
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }
    
    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }
    
}
