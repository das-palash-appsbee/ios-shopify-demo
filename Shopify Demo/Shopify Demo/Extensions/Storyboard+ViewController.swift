
import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>() -> T {
        
        let viewController = self.instantiateViewController(withIdentifier: T.className)
        guard let typedViewController = viewController as? T else {
            fatalError("Unable to cast view controller of type (\(type(of: viewController))) to (\(T.className))")
        }
        return typedViewController
    }
}
