import Foundation

public struct Identifier<Owner, RawValue>: RawRepresentable {
    public var rawValue: RawValue
    
    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
}

extension Identifier: Codable where RawValue: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(RawValue.self)
        self.init(rawValue: rawValue)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}

extension Identifier: CustomStringConvertible where RawValue: CustomStringConvertible {
    public var description: String { rawValue.description }
}

extension Identifier: Equatable where RawValue: Equatable {}
extension Identifier: Hashable where RawValue: Hashable {}
