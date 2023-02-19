import SwiftUI

public extension VStack {
    init(
        alignment: HorizontalAlignment = .center,
        spacing: SpacingToken,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            alignment: alignment,
            spacing: DesignSystemProvider.shared.designSystem.spacing(for: spacing),
            content: content
        )
    }
}

public extension HStack {
    init(
        alignment: VerticalAlignment = .center,
        spacing: SpacingToken,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            alignment: alignment,
            spacing: DesignSystemProvider.shared.designSystem.spacing(for: spacing),
            content: content
        )
    }
}
