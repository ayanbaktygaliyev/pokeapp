import Foundation

public struct AuthResponse: Decodable {
    public let login: String
    
    public init(login: String) {
        self.login = login
    }
}
