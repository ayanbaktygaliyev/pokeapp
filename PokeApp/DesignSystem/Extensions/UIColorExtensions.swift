import UIKit

public extension UIColor {
    convenience init(hex: Int64, alpha: CGFloat) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255,
            green: CGFloat((hex & 0xFF00) >> 8) / 255,
            blue: CGFloat((hex & 0xFF)) / 255,
            alpha: alpha
        )
    }
}
