import SwiftUI

public extension View {
    func button(action: @escaping () -> Void) -> some View {
        SwiftUI.Button(action: action) {
            self
        }
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(
            RoundedCorner(radius: radius, corners: corners)
        )
    }
}
