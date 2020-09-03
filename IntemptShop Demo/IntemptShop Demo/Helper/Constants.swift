//
//  Constants.swift
//  IntemptShop Demo
//
//  Created by Intempt on 25/08/20.
//  Copyright © 2020 Intempt. All rights reserved.
//

import Foundation
import UIKit

let AppTitle = Bundle.main.object(forInfoDictionaryKey:"CFBundleName") as! String
let stroryboard = UIStoryboard(name: "Main", bundle: nil)

struct IntemptConfig {
    //Please go to https://app.intempt.com/home and obtain Intempt credentials
    
    static let orgId = "Your Organization Id" // Example: intempt-hotel-demo
    static let sourceId = "Your Source Id" //Example: 1111111111111111
    static let token = "Your Token" //Example: jAxLS9GWwxGHbJWQAMIDG3tWvDP53e4
}

struct Shopify {
    //Please go to https://shopify.dev/tools/libraries/storefront-api/ios and obtain credentials
    
    static let shopDomain = "Your Shopify Domain" //Example: company.myshopify.com
    static let apiKey = "Your API Key" //Example: aae05a5437d5eef88db5cd877d6acbd9
    static let merchantID = "Your Merchant ID" //Example: merchant.com.your.id
    static let locale = Locale(identifier: "en-US")
}


// MARK: - Alert
func showAlert(title: String, message: String, vc: UIViewController) -> Void {
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    
    let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    
    alert.addAction(cancelAction)
    vc.present(alert, animated: true, completion: nil)
}

//MARK: - Helper Methods

func productDetailsViewControllerWith(_ product: ProductViewModel) -> ProductDetailsViewController {
    let controller: ProductDetailsViewController = stroryboard.instantiateViewController()
    controller.product = product
    return controller
}


