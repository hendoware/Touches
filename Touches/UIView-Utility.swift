
import UIKit

extension UIView {
    func addSubviewWithFlair(_ view: UIView) {
        self.addSubview(view)
        view.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: [], animations: { view.transform = .identity }, completion: nil)
    }
    
    var hasShadow: Bool {
        get {
            return self.layer.shadowPath != nil
        }
        set(newValue) {
            switch newValue {
            case true: // add shadow
                self.layer.shadowRadius = 4
                self.layer.shadowOffset = CGSize(width: 4, height: 4)
                self.layer.shadowOpacity = 0.5
                self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
            case false: // remove shadow
                self.layer.shadowRadius = 0
                self.layer.shadowOffset = .zero
                self.layer.shadowOpacity = 0
                self.layer.shadowPath = nil
            }
        }
    }
}
