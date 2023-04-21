import Foundation
import Combine
import SwiftUI

final class UserRepository {
    var username: String {
        get {
            UserDefaults.standard.string(forKey: "username") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "username")
        }
    }
    
    private let session: SessionCoordinator
    
    init(session: SessionCoordinator = .shared) {
        self.session = session
    }
    
    func changeUsername(username: String) {
        self.username = username
    }
}
