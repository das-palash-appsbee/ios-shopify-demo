

import UIKit

protocol ProductHeaderDelegate: class {
    func productHeader(_ cell: ProductHeaderCell, didAddToCart sender: Any)
}

class ProductHeaderCell: UITableViewCell, ViewModelConfigurable {
    typealias ViewModelType = ProductViewModel
    
    weak var delegate: ProductHeaderDelegate?
    
    @IBOutlet private weak var titleLabel:  UILabel!
    @IBOutlet private weak var priceButton: UIButton!
    
    var viewModel: ViewModelType?
    
    
    //  MARK: - Configure -
    //
    func configureFrom(_ viewModel: ViewModelType) {
        self.viewModel = viewModel
        
        self.titleLabel.text = viewModel.title
        self.priceButton.setTitle(viewModel.price, for: .normal)
    }
}

extension ProductHeaderCell {
    
    @IBAction func addToCartAction(_ sender: Any) {
        self.delegate?.productHeader(self, didAddToCart: sender)
    }
}
