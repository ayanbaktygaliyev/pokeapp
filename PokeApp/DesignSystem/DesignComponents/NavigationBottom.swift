import SwiftUI

public struct NavigationBottom<Tab: Hashable, Content: View>: View {
    @Binding
    private var current: Tab
    private let title: KeyPath<Tab, String>
    private let icon: KeyPath<Tab, ImageAsset>
    private let tabs: [Tab]
    private let content: (Tab) -> Content

    public init(
        _ current: Binding<Tab>,
        title: KeyPath<Tab, String>,
        icon: KeyPath<Tab, ImageAsset>,
        tabs: [Tab],
        @ViewBuilder content: @escaping (Tab) -> Content
    ) {
        self._current = current
        self.title = title
        self.icon = icon
        self.tabs = tabs
        self.content = content
    }

    public var body: some View {
        ZStack {
            TabView(selection: $current) {
                ForEach(tabs, id: \.self) { tab in
                    content(tab)
                        .tag(tab)
                        .tabItem { tabItem(tab: tab) }
                }
            }

            VStack(spacing: .spacing0) {
                Spacer(minLength: 0)
                
                tabBar
            }
        }
        .ignoresSafeArea(edges: .horizontal)
        .ignoresSafeArea(.keyboard)
    }
}

private extension NavigationBottom {
    var tabBar: some View {
        VStack(spacing: .spacing0) {
            Separator(.full)
            
            HStack(spacing: .spacing8) {
                ForEach(tabs, id: \.self) { tab in
                    TabButton {
                        current = tab
                    } label: {
                        tabItem(tab: tab)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .accessibilityHidden(true)
        .ignoresSafeArea()
        .background(Color.white)
    }

    @ViewBuilder
    func tabItem(tab: Tab) -> some View {
        let title = tab[keyPath: title]
        
        VStack(spacing: .spacing2) {
            Image(asset: tab[keyPath: icon])
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(
                    tab == current ? Color(.foodieGreen) : Color(.black)
                )
            
            TextLabel(
                content: title,
                color: tab == current ? .foodieGreen : .black,
                fontToken: .size10,
                style: .medium
            )
        }
        .padding(.vertical, 4)
        .frame(minWidth: 93, maxWidth: .infinity)
        .frame(height: 50)
    }
}

private struct TabButton<Label: View>: View {
    let action: () -> Void
    let label: () -> Label

    var body: some View {
        SwiftUI.Button(
            action: action,
            label: label
        )
    }
}

struct NavigationBottom_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBottom(
            .constant(TabItem.home),
            title: \.title,
            icon: \.icon,
            tabs: TabItem.allCases,
            content: { _ in
                HomeScreen()
            }
        )
    }
}
