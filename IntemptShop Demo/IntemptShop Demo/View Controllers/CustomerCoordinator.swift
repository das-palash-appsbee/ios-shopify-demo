

import UIKit

class CustomerCoordinator: UIViewController {
    
    private let hostController = UINavigationController(navigationBarClass: UINavigationBar.self, toolbarClass: UIToolbar.self)
    
    // ----------------------------------
    //  MARK: - View -
    //
    override func loadView() {
        super.loadView()
        
        self.addChild(self.hostController)
        self.view.addSubview(self.hostController.view)
        self.hostController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.hostController.view.frame = self.view.bounds
        self.hostController.didMove(toParent: self)
        
        if let _ = AccountController.shared.accessToken {
            self.showOrders(animated: false)
        } else {
            self.showLogin(animated: false)
        }
    }
    
    private func showOrders(animated: Bool) {
        let customerController: CustomerViewController = self.storyboard!.instantiateViewController()
        customerController.delegate = self
        self.hostController.setViewControllers([customerController], animated: animated)
    }
    
    private func showLogin(animated: Bool) {
        let loginController: LoginViewController = self.storyboard!.instantiateViewController()
        loginController.delegate = self
        self.hostController.setViewControllers([loginController], animated: animated)
    }
}

// ----------------------------------
//  MARK: - CustomerControllerDelegate -
//
extension CustomerCoordinator: CustomerControllerDelegate {
    func customerControllerDidCancel(_ customerController: CustomerViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func customerControllerDidLogout(_ customerController: CustomerViewController) {
        guard let accessToken = AccountController.shared.accessToken else {
            return
        }
        
        Client.shared.logout(accessToken: accessToken) { success in
            if success {
                AccountController.shared.deleteAccessToken()
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

// ----------------------------------
//  MARK: - LoginControllerDelegate -
//
extension CustomerCoordinator: LoginControllerDelegate {
    
    func loginControllerDidCancel(_ loginController: LoginViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func loginController(_ loginController: LoginViewController, didLoginWith email: String, passowrd: String) {
        Client.shared.login(email: email, password: passowrd) { accessToken in
            if let accessToken = accessToken {
                AccountController.shared.save(accessToken: accessToken)
                self.showOrders(animated: true)
            } else {
                let alert = UIAlertController(title: "Login Error", message: "Failed to login a customer with this email and password. Please check your credentials and try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
