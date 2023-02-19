import SwiftUI

public struct TextLabel: View {
    private let content: String
    private let color: ColorToken
    private let fontToken: FontToken
    private let style: FontStyle
    
    public init(
        content: String,
        color: ColorToken,
        fontToken: FontToken,
        style: FontStyle
    ) {
        self.content = content
        self.color = color
        self.fontToken = fontToken
        self.style = style
    }
    
    public var body: some View {
        Text(verbatim: content)
            .foregroundColor(Color(color))
            .font(.system(size: fontToken.rawValue, weight: style.rawValue, design: .default))
    }
}
