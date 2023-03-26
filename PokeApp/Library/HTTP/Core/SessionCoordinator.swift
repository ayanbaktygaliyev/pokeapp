import Combine
import Foundation

public final class SessionCoordinator {
    public static let shared = SessionCoordinator(baseURL: Constants.baseURL)
    
    private let baseURL: URL
    
    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    private lazy var sessionConfiguration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        return configuration
    }()
    
    public func load<T: Decodable>(
        request: JSONRequest,
        parameters: RequestParameters? = nil
    ) -> AnyPublisher<Result<T, Error>, Never> {
        let publisher = sendPublisher(
            request: request,
            method: .get,
            parameters: parameters
        )
        
        return publisher.map(decode).eraseToAnyPublisher()
    }
    
    public func post<T: Decodable>(
        request: JSONRequest,
        parameters: RequestParameters? = nil
    ) -> AnyPublisher<Result<T, Error>, Never> {
        let publisher = sendPublisher(
            request: request,
            method: .post,
            parameters: parameters
        )
        
        return publisher.map(decode).eraseToAnyPublisher()
    }
    
    public func delete<T: Decodable>(
        request: JSONRequest,
        parameters: RequestParameters? = nil
    ) -> AnyPublisher<Result<T, Error>, Never> {
        let publisher = sendPublisher(
            request: request,
            method: .delete,
            parameters: parameters
        )
        
        return publisher.map(decode).eraseToAnyPublisher()
    }
    
    public func update<T: Decodable>(
        request: JSONRequest,
        parameters: RequestParameters? = nil
    ) -> AnyPublisher<Result<T, Error>, Never> {
        let publisher = sendPublisher(
            request: request,
            method: .patch,
            parameters: parameters
        )
        
        return publisher.map(decode).eraseToAnyPublisher()
    }
    
    public func replace<T: Decodable>(
        request: JSONRequest,
        parameters: RequestParameters? = nil
    ) -> AnyPublisher<Result<T, Error>, Never> {
        let publisher = sendPublisher(
            request: request,
            method: .put,
            parameters: parameters
        )
        
        return publisher.map(decode).eraseToAnyPublisher()
    }
    
    private func sendPublisher(
        request: JSONRequest,
        method: HTTPMethod,
        parameters: RequestParameters? = nil
    ) -> AnyPublisher<Result<Data, SessionError>, Never> {
        let url = baseURL.appendingPathComponent(request.path)
        let urlRequest = makeURLRequest(url: url, method: method, parameters: parameters)
        
        return URLSession(configuration: sessionConfiguration)
            .dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard response is HTTPURLResponse else {
                    return .failure(.notHTTPResponse)
                }
                
                return .success(data)
            }
            .catch { failure in
                return Just(
                    .failure(
                        .apiError(String(describing: failure))
                    )
                )
            }
            .eraseToAnyPublisher()
    }
}

private extension SessionCoordinator {
    private func makeURLRequest(
        url: URL,
        method: HTTPMethod,
        parameters: RequestParameters?
    ) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        if method != .get {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters ?? [], options: [.prettyPrinted])
            } catch(let error) {
                print("// Parameter error: \(error.localizedDescription)")
            }
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
    
    private func decode<T: Decodable>(from result: Result<Data, SessionError>) -> Result<T, Error> {
        let decoder = JSONDecoder()
        
        switch result {
        case .success(let data):
            if let error = try? decoder.decode(ErrorResponse.self, from: data) {
                return .failure(SessionError.apiError(error.error))
            } else {
                do {
                    let data = try decoder.decode(T.self, from: data)
                    return .success(data)
                } catch(let error) {
                    let mappingError = SessionError.unableToParseData(
                        String(describing: error)
                    )
                    return .failure(mappingError)
                }
            }
        case .failure(let error):
            return .failure(error)
        }
    }
    
    private enum Constants {
        static let baseURL = URL(string: "http://1140427-ci11141.tw1.ru:8080")!
    }
}
