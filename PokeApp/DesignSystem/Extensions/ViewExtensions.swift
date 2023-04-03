import SwiftUI

public extension View {
    func button(action: @escaping () -> Void) -> some View {
        SwiftUI.Button(action: action) {
            self
        }
    }
    
    func overlay<Overlay: View>(
        if condition: Bool,
        alignment: Alignment = .center,
        @ViewBuilder content: () -> Overlay
    ) -> some View {
        overlay(condition ? content() : nil, alignment: alignment)
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(
            RoundedCorner(radius: radius, corners: corners)
        )
    }
}
