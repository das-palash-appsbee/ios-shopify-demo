

import UIKit

protocol LoginControllerDelegate: class {
    func loginControllerDidCancel(_ loginController: LoginViewController)
    func loginController(_ loginController: LoginViewController, didLoginWith email: String, passowrd: String)
}

class LoginViewController: UIViewController {
    
    weak var delegate: LoginControllerDelegate?
    
    @IBOutlet private weak var loginButton:   UIButton!
    @IBOutlet private weak var usernameField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    
    private var email: String {
        return self.usernameField.text ?? ""
    }
    
    private var password: String {
        return self.passwordField.text ?? ""
    }
    
    // ----------------------------------
    //  MARK: - View Loading -
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateLoginState()
    }
    
    // ----------------------------------
    //  MARK: - Updates -
    //
    private func updateLoginState() {
        let isValid = !self.email.isEmpty && !self.password.isEmpty
        
        self.loginButton.isEnabled = isValid
        self.loginButton.alpha     = isValid ? 1.0 : 0.5
    }
}

// ----------------------------------
//  MARK: - Actions -
//
extension LoginViewController {
 
    @IBAction private func textFieldValueDidChange(textField: UITextField) {
        self.updateLoginState()
    }
    
    @IBAction private func loginAction(_ sender: UIButton) {
        self.delegate?.loginController(self, didLoginWith: self.email, passowrd: self.password)
    }
    
    @IBAction private func cancelAction(_ sender: UIButton) {
        self.delegate?.loginControllerDidCancel(self)
    }
}
