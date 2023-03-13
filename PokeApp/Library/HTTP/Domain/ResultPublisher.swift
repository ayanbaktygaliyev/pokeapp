import Combine

public typealias ResultPublisher<T: Decodable> = AnyPublisher<Result<T, Error>, Never>
