import UIKit

class DragView: UIView {
    
    @objc
    func singleTapped(_ tapGestureRecognizer: UITapGestureRecognizer) {
        
    }
    @objc
    func doubleTapped(_ tapGestureRecognizer: UITapGestureRecognizer) {
        //self.removeFromSuperview()
        UIView.perform(.delete, on: [self], options: [],
                       animations: nil,
                       completion: { _ in self.removeFromSuperview() })
    }
    
    @objc
    func panned(_ panRecognizer: UIPanGestureRecognizer) {
        if panRecognizer.state == .ended {
            // find the final offset and move the view
            let movement = panRecognizer.translation(in: superview)
            self.transform = .identity
            self.center = CGPoint(
                x: self.center.x + movement.x,
                y: self.center.y + movement.y)
            self.hasShadow = false
        }
        
        if panRecognizer.state == .changed {
            // provide feedback during movement
            self.hasShadow = true
            let movement = panRecognizer.translation(in: superview)
            self.transform = CGAffineTransform(translationX: movement.x, y: movement.y)
        }
        
        if panRecognizer.state == .began {
            superview?.bringSubviewToFront(self)
        }
    }
    
    @objc
    func longPressed(_ longPressRecognizer: UILongPressGestureRecognizer) {
        self.isUserInteractionEnabled = false
        self.alpha = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 12
        
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTapped(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        self.addGestureRecognizer(doubleTapRecognizer)
        
        let singleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(singleTapped(_:)))
        self.addGestureRecognizer(singleTapRecognizer)
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panned(_:)))
        self.addGestureRecognizer(panRecognizer)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed(_:)))
        self.addGestureRecognizer(longPressRecognizer)
    }
    
    
    
}
