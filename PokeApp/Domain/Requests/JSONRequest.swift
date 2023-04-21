import Foundation

public protocol JSONRequest {
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}
