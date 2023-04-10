import SwiftUI

struct RoundDiningTableView: View {
    @Binding var isSelected: Bool
    let isReserved: Bool
    let tableNumber: Int
    
    var body: some View {
        VStack(spacing: .spacing10) {
            Circle()
                .fill(Color(tableColor))
                .frame(width: 16, height: 16)
            
            HStack(spacing: .spacing10) {
                Circle()
                    .fill(Color(tableColor))
                    .frame(width: 16, height: 16)
                
                mainDiningTable
                
                Circle()
                    .fill(Color(tableColor))
                    .frame(width: 16, height: 16)
            }
            
            Circle()
                .fill(Color(tableColor))
                .frame(width: 16, height: 16)
        }
    }
    
    private var mainDiningTable: some View {
        ZStack {
            Circle()
                .fill(Color(tableColor))
                .frame(width: 42, height: 42)
            
            TextLabel(
                content: "\(tableNumber)",
                color: .black,
                fontToken: .size22,
                style: .bold
            )
        }
    }
    
    private var tableColor: ColorToken {
        if isReserved {
            return .softGrey
        }
        
        return isSelected ? .foodieGreen : .white
    }
}
