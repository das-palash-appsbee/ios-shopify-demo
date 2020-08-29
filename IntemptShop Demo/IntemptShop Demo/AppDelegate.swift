

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // ----------------------------------
    //  MARK: - Application Launch -
    //
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        /* ----------------------------------------
         ** Initialize the cart controller and pre-
         ** load any cached cart items.
         */
        _ = CartController.shared
        
        return true
    }
}

