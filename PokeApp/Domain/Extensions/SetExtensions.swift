import Foundation

public extension Set {
    func firstMatch(_ other: Set<Element>) -> Element? {
        intersection(other).first
    }
}
