import SwiftUI

struct ReserveDetailRow<Content: View>: View {
    let title: String
    let icon: String
    let content: () -> Content
    
    var body: some View {
        HStack {
            HStack(spacing: .spacing8) {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                TextLabel(
                    content: title,
                    color: .black,
                    fontToken: .size16,
                    style: .regular
                )
            }
            
            Spacer()
            
            content()
        }
    }
}
