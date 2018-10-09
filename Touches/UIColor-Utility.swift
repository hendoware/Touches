
import UIKit

extension UIColor {
    static func randomLightColor() -> UIColor {
        let halfRange: ClosedRange<CGFloat> = 0.5 ... 1.0
        return UIColor(
            red: CGFloat.random(in: halfRange),
            green: CGFloat.random(in: halfRange),
            blue: CGFloat.random(in: halfRange),
            alpha: 1
        )
    }
}
