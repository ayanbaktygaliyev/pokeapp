import SwiftUI

public extension View {
    func button(action: @escaping () -> Void) -> some View {
        SwiftUI.Button(action: action) {
            self
        }
    }
}
