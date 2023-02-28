import SwiftUI

public struct TextField: View {
    @Binding
    private var text: String
    private let placeholder: String
    
    public init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
    }
    
    public var body: some View {
        content
    }
}

private extension TextField {
    private var content: some View {
        VStack(spacing: .spacing18) {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    placeholderView
                }
                
                SwiftUI.TextField("", text: $text)
                    .padding(.horizontal, 16)
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
        TextField(text: .constant(""), placeholder: "Username")
    }
}
