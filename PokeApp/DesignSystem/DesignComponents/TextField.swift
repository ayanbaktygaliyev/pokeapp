import SwiftUI

public struct TextField: View {
    public enum Status: Equatable {
        case normal
        case error(message: String?)

        public var errorMessage: String? {
            switch self {
            case .error(let message?):
                return message

            case .normal, .error(.none):
                return nil
            }
        }
    }
    
    @Binding
    private var text: String
    private let placeholder: String
    private let status: Status
    
    public init(
        text: Binding<String>,
        placeholder: String,
        status: Status = .normal
    ) {
        self._text = text
        self.placeholder = placeholder
        self.status = status
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: .spacing4) {
            textField
            
            if let errorMessage = status.errorMessage {
                TextLabel(
                    content: errorMessage,
                    color: .attention,
                    fontToken: .size15,
                    style: .semibold
                )
                .padding(.horizontal, 16)
            }
        }
    }
}

private extension TextField {
    private var textField: some View {
        VStack(spacing: .spacing18) {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    placeholderView
                }
                
                SwiftUI.TextField("", text: $text)
                    .padding(.horizontal, 16)
                    .textInputAutocapitalization(.never)
                    .font(.system(size: 17))
            }
            
            Separator(.indented)
        }
        .frame(height: 60)
    }
    
    private var placeholderView: some View {
        Text(placeholder)
            .foregroundColor(.black)
            .padding(.leading, 16)
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        TextField(text: .constant(""), placeholder: "Username", status: .normal)
    }
}
