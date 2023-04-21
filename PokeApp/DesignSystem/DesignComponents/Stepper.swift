import SwiftUI

public struct Stepper: View {
    @Binding var count: Int
    
    public var body: some View {
        HStack(spacing: .spacing18) {
            minusButton
            
            TextLabel(
                content: "\(count)",
                color: .black,
                fontToken: .size16,
                style: .medium
            )
            
            plusButton
        }
    }
    
    private var minusButton: some View {
        SwiftUI.Button {
            guard count > 0 else {
                return
            }
            count -= 1
        } label: {
            ZStack {
                Circle()
                    .fill(Color(.softGrey))
                    .frame(width: 20, height: 20)
                
                Image(systemName: "minus")
                    .foregroundColor(.white)
            }
        }
    }
    
    private var plusButton: some View {
        SwiftUI.Button {
            count += 1
        } label: {
            ZStack {
                Circle()
                    .fill(Color(.foodieGreen))
                    .frame(width: 20, height: 20)
                
                Image(systemName: "plus")
                    .foregroundColor(.white)
            }
        }
    }
}
