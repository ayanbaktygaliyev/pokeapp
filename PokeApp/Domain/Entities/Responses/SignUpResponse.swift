import Foundation

public struct SignUpResponse: Decodable {
    public let login: String
    
    public init(login: String) {
        self.login = login
    }
}
