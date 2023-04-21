import Foundation

public enum SessionError: Error, Equatable {    
    case notHTTPResponse
    case badURL(_ error: String)
    case invalidJSON(_ error: String)
    case apiError(_ error: String)
    case unableToParseData(_ error: String)
    case emptyData
    
    var errorString: String? {
        switch self {
        case .badURL(let error),
            .invalidJSON(let error),
            .apiError(let error),
            .unableToParseData(let error):
            return error
            
        case .notHTTPResponse, .emptyData:
            return nil
        }
    }
}
