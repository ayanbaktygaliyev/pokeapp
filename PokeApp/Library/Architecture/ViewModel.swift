import Foundation
import SwiftUI

public protocol ViewModel {
    associatedtype State
    associatedtype Event
    
    func send(event: Event)
}
