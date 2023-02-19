import SwiftUI

extension EnvironmentValues {
    var routerNavigationStyle: NavigationStyle {
        get { self[NavigationStyleKey.self] }
        set { self[NavigationStyleKey.self] = newValue }
    }

    var routerNavigationHidden: Binding<Bool> {
        get { self[NavigationHiddenKey.self] }
        set { self[NavigationHiddenKey.self] = newValue }
    }
    
    var routerNavigationTitle: Binding<String> {
        get { self[NavigationTitleKey.self] }
        set { self[NavigationTitleKey.self] = newValue }
    }
}

private struct NavigationTitleKey: EnvironmentKey {
    static let defaultValue: Binding<String> = .constant("")
}

private struct NavigationHiddenKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(true)
}

private struct NavigationStyleKey: EnvironmentKey {
    static let defaultValue: NavigationStyle = NavigationStyle()
}
