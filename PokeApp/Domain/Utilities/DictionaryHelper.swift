import Foundation

struct DictionaryHelper {
    public static func makeDictionary<T: Encodable>(
        from object: T,
        strategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys
    ) -> [String: Any] {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.keyEncodingStrategy = strategy
        let data = try! encoder.encode(object)
        let dictionary = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
        return dictionary
    }
}
