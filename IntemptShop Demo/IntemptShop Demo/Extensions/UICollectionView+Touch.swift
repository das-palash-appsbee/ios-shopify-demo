

import UIKit

extension UICollectionView {
    
    func rectForItem(at indexPath: IndexPath) -> CGRect? {
        if let attributes = self.layoutAttributesForItem(at: indexPath) {
            return attributes.frame
        }
        return nil
    }
}
