

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel:  UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    
    var customer: CustomerViewModel? {
        didSet {
            view.setNeedsLayout()
        }
    }

    //  MARK: - Layout -
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.updateState()
    }
    
    private func updateState() {
        guard let customer = self.customer else {
            self.nameLabel.text  = nil
            self.emailLabel.text = nil
            self.phoneLabel.text = nil
            
            return
        }
        
        self.nameLabel.text  = customer.displayName
        self.emailLabel.text = customer.email
        self.phoneLabel.text = customer.phoneNumber
    }
}
