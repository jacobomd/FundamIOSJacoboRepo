

import UIKit

// MARK: - UIViewController+Navigation
extension UIViewController {
    func wrappedInNavigation() -> UINavigationController {
        // OJO! Esto crea una NUEVA instancia de UINavigationController
        return UINavigationController(rootViewController: self)
    }
    
}
