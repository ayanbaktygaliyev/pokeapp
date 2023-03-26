import Foundation

enum AuthRequest: JSONRequest {
    struct Parameter: Encodable {
        let login: String
        let password: String
    }
    
    case signIn
    case signUp
    
    var path: String {
        switch self {
        case .signIn:
            return "/login"
        case .signUp:
            return "/register"
        }
    }
}
