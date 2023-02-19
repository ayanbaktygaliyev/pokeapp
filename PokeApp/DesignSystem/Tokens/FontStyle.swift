import SwiftUI

public enum FontStyle {
    public typealias RawValue = Font.Weight
    
    public var rawValue: Font.Weight {
        switch self {
        case .regular: return .regular
        case .semibold: return .semibold
        case .bold: return .bold
        }
    }
    
    case regular
    case semibold
    case bold
}
