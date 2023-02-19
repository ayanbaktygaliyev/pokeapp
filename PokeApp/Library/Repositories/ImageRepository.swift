import Combine
import UIKit

protocol ImageRepositoryProtocol: WebRepository {
    func load(imageURL: URL) -> AnyPublisher<UIImage, Error>
}

struct ImageRepository: ImageRepositoryProtocol {
    let session: URLSession
    let baseURL: String
    let bgQueue = DispatchQueue(label: "image_repository")
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func load(imageURL: URL) -> AnyPublisher<UIImage, Error> {
        return download(rawImageURL: imageURL)
            .subscribe(on: bgQueue)
            .receive(on: DispatchQueue.main)
            .extractUnderlyingError()
            .eraseToAnyPublisher()
    }
    
    private func download(rawImageURL: URL) -> AnyPublisher<UIImage, Error> {
        let urlRequest = URLRequest(url: rawImageURL)
        return session.dataTaskPublisher(for: urlRequest)
            .requestData()
            .tryMap { data -> UIImage in
                guard let image = UIImage(data: data) else {
                    throw APIError.imageDeserialization
                }
                return image
            }
            .eraseToAnyPublisher()
    }
}

