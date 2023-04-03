//import SwiftUI
//
//public struct Snackbar: View {
//    public enum Variant: CaseIterable {
//        case `default`
//        case attention
//    }
//
//    public enum BodyContent {
//        case normal(String)
//        case strong(String)
//
//        public var bodyString: String {
//            switch self {
//            case .normal(let title),
//                .strong(let title):
//                return title
//            }
//        }
//
//        public var typography: FontStyle {
//            switch self {
//            case .normal:
//                return .medium
//
//            case .strong:
//                return .semibold
//            }
//        }
//    }
//
//    public enum Caption {
//        case normal(String)
//        case strong(String)
//
//        public var captionString: String {
//            switch self {
//            case .normal(let title),
//                .strong(let title):
//                return title
//            }
//        }
//
//        public var typography: FontToken {
//            switch self {
//            case .normal:
//                return .size70
//
//            case .strong:
//                return .size70
//            }
//        }
//    }
//
//    public struct ButtonInput {
//        public let label: String
//        public let action: () -> Void
//
//        public init(
//            label: String,
//            action: @escaping () -> Void
//        ) {
//            self.label = label
//            self.action = action
//        }
//    }
//
//    public enum DisplayDuration: CaseIterable {
//        case short
//        case long
//        case unlimited
//
//        public var deadline: Int? {
//            switch self {
//            case .short:
//                return 4
//
//            case .long:
//                return 10
//
//            case .unlimited:
//                return nil
//            }
//        }
//    }
//
//    private let bodyContent: BodyContent
//    private let caption: Caption?
//    private let button: ButtonInput?
//    private let variant: Variant
//
//    @Environment(\.isEnabled) private var isEnabled: Bool
//    @State private var isHover = false
//
//    public var body: some View {
//        content
//    }
//
//    public init(
//        _ body: BodyContent,
//        caption: Caption? = nil,
//        button: ButtonInput? = nil,
//        variant: Variant
//    ) {
//        self.bodyContent = body
//        self.caption = caption
//        self.button = button
//        self.variant = variant
//    }
//}
//
//private extension Snackbar {
//    var content: some View {
//        HStack(spacing: .spacing0) {
//            Spacer(minLength: 4)
//                .fixedSize()
//
//            textContent
//            buttonContent
//        }
//        .padding(.vertical, 8)
//        .padding(.leading, 16)
//        .padding(.trailing, button == nil ? 16 : 8)
//        .background(backgroundColor)
//        .cornerRadius(4)
//        .overlay(shape)
//        .shadow(color: .white, radius: 8, x: 0, y: 4)
//        .onHover {
//            isHover = $0
//        }
//    }
//
//    var shape: some View {
//        RoundedRectangle(.medium)
//            .stroke(.normal, color: borderColor)
//    }
//
//    var textContent: some View {
//        VStack(alignment: .leading, spacing: .spacing4) {
//            TextLabel(bodyContent.bodyString, dynamic: bodyContent.typography, color: .primary)
//                .lineLimit(2)
//                .fixedSize(horizontal: false, vertical: true)
//
//            if let caption = caption {
//                TextLabel(caption.captionString, dynamic: caption.typography, color: .primary)
//                    .lineLimit(1)
//            }
//        }
//    }
//
//    @ViewBuilder
//    func buttonView(input: ButtonInput) -> some View {
//        switch variant {
//        case .default:
//            CustomizableButton(
//                label: input.label,
//                icon: nil,
//                labelColor: .token(
//                    normal: .text(.accent),
//                    pressed: .text(.accent),
//                    hover: .text(.accent)
//                ),
//                backgroundColor: .custom(
//                    normal: nil,
//                    pressed: .init(
//                        light: Color(.background(.accentActive)).opacity(.xweak),
//                        dark: Color(.background(.accentActive)).opacity(.xweak)
//                    ),
//                    hover: .init(
//                        light: Color(.background(.accentHighlight)).opacity(.xweak),
//                        dark: Color(.background(.accentHighlight)).opacity(.xweak)
//                    )
//                ),
//                borderColor: nil,
//                size: .small,
//                width: .fixed(.measure88),
//                action: input.action
//            )
//
//        case .attention:
//            Button(
//                label: input.label,
//                icon: nil,
//                variant: .flat,
//                size: .small,
//                width: .fixed(.measure88),
//                action: input.action
//            )
//        }
//    }
//
//    @ViewBuilder
//    var buttonContent: some View {
//        if isEnabled, let button = button {
//            Spacer(minLength: .spacing4)
//            buttonView(input: button)
//                .accessibilityElement(children: .ignore)
//                .accessibilityAction(named: button.label, button.action)
//                .accessibilityAction(.magicTap, button.action)
//        }
//        else {
//            Spacer(minLength: .spacing0)
//        }
//    }
//
//    var backgroundColor: ColorToken.Background {
//        switch variant {
//        case .default:
//            return isHover ? .accentThinHighlight : .accentThin
//
//        case .attention:
//            return isHover ? .attentionThinHighlight : .attentionThin
//        }
//    }
//
//    var borderColor: ColorToken.Border {
//        switch variant {
//        case .default:
//            return .accent
//
//        case .attention:
//            return .attention
//        }
//    }
//
//    var iconColor: ColorToken.Icon {
//        switch variant {
//        case .default:
//            return .accentActive
//
//        case .attention:
//            return .attention
//        }
//    }
//}
//
//struct Snackbar_Previews: PreviewProvider {
//    static var previews: some View {
//        Snackbar(
//            <#T##body: Snackbar.BodyContent##Snackbar.BodyContent#>,
//            icon: <#T##<<error type>>#>,
//            caption: <#T##Snackbar.Caption?#>,
//            button: <#T##Snackbar.ButtonInput?#>,
//            variant: <#T##Snackbar.Variant#>
//        )
//    }
//}
