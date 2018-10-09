import UIKit

class ViewController: UIViewController {

    @IBAction func tappedView(_ recognizer: UITapGestureRecognizer) {
        let position = recognizer.location(in: self.view)
        let viewFrame = CGRect(x: position.x - 50, y: position.y - 50, width: 100, height: 100)
        let newView = DragView(frame: viewFrame)
        newView.backgroundColor = UIColor.randomLightColor()
//        view.addSubview(newView)
        view.addSubviewWithFlair(newView)
    }
    
    @IBAction func longPressedView(_ sender: Any) {
        for subview in self.view.subviews {
            subview.isUserInteractionEnabled = true
            subview.alpha = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

