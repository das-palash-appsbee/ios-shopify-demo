

import UIKit

class OrderCell: UITableViewCell, ViewModelConfigurable {

    typealias ViewModelType = OrderViewModel
    
    private(set) var viewModel: ViewModelType?
    
    @IBOutlet private weak var titleLabel:    UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var detailLabel:   UILabel!
    
    // ----------------------------------
    //  MARK: - Configure -
    //
    func configureFrom(_ viewModel: ViewModelType) {
        titleLabel.text    = "#\(viewModel.number)"
        subtitleLabel.text = viewModel.email ?? "No email"
        detailLabel.text   = Currency.stringFrom(viewModel.totalPrice)
    }
}
