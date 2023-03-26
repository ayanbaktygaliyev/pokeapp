import Foundation

public enum SessionError: Error {    
    case notHTTPResponse
    case badURL(_ error: String)
    case invalidJSON(_ error: String)
    case apiError(_ error: String)
    case unableToParseData(_ error: String)
    case emptyData
}
