

import UIKit
import MobileBuySDK
import PassKit

enum PaymentType {
    case applePay
    case webCheckout
}

protocol TotalsControllerDelegate: class {
    func totalsController(_ totalsController: TotalsViewController, didRequestPaymentWith type: PaymentType)
}

class TotalsViewController: UIViewController {
    
    @IBOutlet private weak var subtotalTitleLabel: UILabel!
    @IBOutlet private weak var subtotalLabel: UILabel!
    @IBOutlet private weak var buttonStackView: UIStackView!
    
    weak var delegate: TotalsControllerDelegate?
    
    var itemCount: Int = 0 {
        didSet {
            self.subtotalTitleLabel.text = "\(self.itemCount) Item\(itemCount == 1 ? "" : "s")"
        }
    }
    
    var subtotal: Decimal = 0.0 {
        didSet {
            self.subtotalLabel.text = Currency.stringFrom(self.subtotal)
        }
    }
    

    //  MARK: - View Lifecyle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadPurchaseOptions()
    }
    
    private func loadPurchaseOptions() {
        
        let webCheckout = RoundedButton(type: .system)
        webCheckout.backgroundColor = UIColor.applicationGreen
        webCheckout.addTarget(self, action: #selector(webCheckoutAction(_:)), for: .touchUpInside)
        webCheckout.setTitle("Checkout",  for: .normal)
        webCheckout.setTitleColor(.white, for: .normal)
        self.buttonStackView.addArrangedSubview(webCheckout)
        
//        if PKPaymentAuthorizationController.canMakePayments() {
//            let applePay = PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .black)
//            applePay.addTarget(self, action: #selector(applePayAction(_:)), for: .touchUpInside)
//            self.buttonStackView.addArrangedSubview(applePay)
//        }
    }
    
    //  MARK: - Actions -

    @objc func webCheckoutAction(_ sender: Any) {
     //   self.delegate?.totalsController(self, didRequestPaymentWith: .webCheckout)
        
        let alert = UIAlertController(title: "Payment Successful", message: "", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            for i in CartController.shared.items {
                CartController.shared.removeAllQuantitiesFor(i)
            }
            
            self.dismiss(animated: true, completion: nil)
        }))
              
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func applePayAction(_ sender: Any) {
        self.delegate?.totalsController(self, didRequestPaymentWith: .applePay)
    }
}
