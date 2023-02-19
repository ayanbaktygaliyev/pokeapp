import SwiftUI

public extension Color {
    init(_ token: ColorToken, alpha: CGFloat = 1) {
        self.init(
            UIColor(hex: token.rawValue, alpha: alpha)
        )
    }
}
