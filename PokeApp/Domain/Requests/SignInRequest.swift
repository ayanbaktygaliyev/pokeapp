import Foundation

enum SignInRequest: JSONRequest {
    case signIn(login: String, password: String)
    case todos(id: Int)
    case posts
    
    var path: String {
        switch self {
        case .signIn:
            return "/login"
        case .todos(let id):
            return "/todos/\(id)"
        case .posts:
            return "/posts"
        }
    }
}

public struct Post: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}

public struct PostParam: Codable {
    let title: String
    let body: String
    let userId: Int
}

public struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
