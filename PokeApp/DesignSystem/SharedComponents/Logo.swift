import SwiftUI

public struct Logo: View {
    private let fontToken: FontToken
    
    public init(fontToken: FontToken) {
        self.fontToken = fontToken
    }
    
    public var body: some View {
        content
    }
}

private extension Logo {
    var content: some View {
        TextLabel(
            content: "foodie.",
            color: .foodieGreen,
            fontToken: fontToken,
            style: .bold
        )
    }
}
