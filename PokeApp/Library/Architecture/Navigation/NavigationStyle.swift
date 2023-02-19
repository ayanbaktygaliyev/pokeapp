import SwiftUI

final class NavigationStyle: ObservableObject {
    @Published
    var isHidden = true
    var isHiddenOwner: String = ""

    @Published
    var title = ""
    var titleOwner: String = ""
}
