import SwiftUI

public struct DesignSystem {
    public init() {}
    
    public func spacing(for token: SpacingToken) -> CGFloat {
        token.rawValue
    }
}
