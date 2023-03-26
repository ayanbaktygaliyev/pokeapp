import Foundation

public struct ErrorResponse: Decodable {
    public let error: String
    
    public init(error: String) {
        self.error = error
    }
}
