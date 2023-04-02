import Combine

public typealias ResultPublisher<T: Decodable> = AnyPublisher<Result<T, SessionError>, Never>
