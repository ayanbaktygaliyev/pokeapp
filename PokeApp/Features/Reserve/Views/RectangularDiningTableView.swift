import SwiftUI

struct RectangularDiningTableView: View {
    enum Variant {
        case vertical
        case horizontal
    }
    
    @Binding var isSelected: Bool
    let isReserved: Bool
    let tableNumber: Int
    let variant: Variant
    
    init(
        isSelected: Binding<Bool>,
        isReserved: Bool,
        tableNumber: Int,
        variant: Variant = .vertical
    ) {
        self._isSelected = isSelected
        self.isReserved = isReserved
        self.tableNumber = tableNumber
        self.variant = variant
    }
    
    var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        switch variant {
        case .vertical:
            HStack(spacing: .spacing8) {
                chairs
                
                mainDiningTable
                
                chairs
            }
        case .horizontal:
            VStack(spacing: .spacing8) {
                chairs
                
                mainDiningTable
                
                chairs
            }
        }
    }
    
    @ViewBuilder
    private var chairs: some View {
        switch variant {
        case .vertical:
            VStack(spacing: .spacing20) {
                Circle()
                    .fill(Color(tableColor))
                    .frame(width: 16, height: 16)
                
                Circle()
                    .fill(Color(tableColor))
                    .frame(width: 16, height: 16)
                
                Circle()
                    .fill(Color(tableColor))
                    .frame(width: 16, height: 16)
            }
        case .horizontal:
            HStack(spacing: .spacing20) {
                Circle()
                    .fill(Color(tableColor))
                    .frame(width: 16, height: 16)
                
                Circle()
                    .fill(Color(tableColor))
                    .frame(width: 16, height: 16)
                
                Circle()
                    .fill(Color(tableColor))
                    .frame(width: 16, height: 16)
                
                Circle()
                    .fill(Color(tableColor))
                    .frame(width: 16, height: 16)
                
                Circle()
                    .fill(Color(tableColor))
                    .frame(width: 16, height: 16)
            }
        }
        
    }
    
    private var mainDiningTable: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(tableColor))
                .frame(width: tableWidth, height: tableHeight)
            
            TextLabel(
                content: "Capacity: \(tableNumber)",
                color: .black,
                fontToken: .size22,
                style: .bold
            )
        }
    }
    
    private var tableWidth: CGFloat {
        switch variant {
        case .vertical:
            return 49
        case .horizontal:
            return 185
        }
    }
    
    private var tableHeight: CGFloat {
        switch variant {
        case .vertical:
            return 104
        case .horizontal:
            return 49
        }
    }
    
    private var tableColor: ColorToken {
        if isReserved {
            return .softGrey
        }
        
        return isSelected ? .foodieGreen : .white
    }
}
