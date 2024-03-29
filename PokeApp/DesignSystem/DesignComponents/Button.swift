import SwiftUI

public struct Button: View {
    private let title: String
    private let color: ColorToken
    private let action: () -> Void
    
    public init(
        title: String,
        color: ColorToken = .foodieGreen,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.color = color
        self.action = action
    }
    
    public var body: some View {
        content
    }
}

private extension Button {
    private var content: some View {
        SwiftUI.Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .frame(height: 56)
                    .foregroundColor(Color(color))
                
                TextLabel(
                    content: title,
                    color: .white,
                    fontToken: .size17,
                    style: .regular
                )
            }
        }
        .padding(.horizontal, 16)
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        Button(title: "Sign in", action: {})
    }
}
