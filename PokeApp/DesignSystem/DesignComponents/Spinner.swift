import SwiftUI

public struct Spinner: View {
    public enum Style: CaseIterable {
        case underlay
    }

    public let style: Style
    public let isAnimating: Bool

    public init(_ style: Style, isAnimating: Bool = true) {
        self.style = style
        self.isAnimating = isAnimating
    }

    public var body: some View {
        ZStack {
            backgroundView
            ActivityIndicator(spinner: self)
        }
    }
}

private extension Spinner {
    @ViewBuilder
    var backgroundView: some View {
        if case .underlay = style {
            ZStack {
                Blocker()

                Color(.overlayBackground)
                    .frame(width: 80, height: 80)
                    .cornerRadius(16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

private extension Spinner.Style {
    var indicatorStyle: UIActivityIndicatorView.Style {
        switch self {
        case .underlay:
            return .large
        }
    }

    var indicatorColor: ColorToken {
        switch self {
        case .underlay:
            return .white
        }
    }
}

private struct ActivityIndicator: UIViewRepresentable {
    let spinner: Spinner

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let uiView = UIActivityIndicatorView(style: spinner.style.indicatorStyle)
        uiView.hidesWhenStopped = false
        return uiView
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.style = spinner.style.indicatorStyle
        uiView.color = UIColor(Color(.white))
        spinner.isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

private struct Blocker: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        UIView()
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.backgroundColor = UIColor(Color.clear)
    }
}
