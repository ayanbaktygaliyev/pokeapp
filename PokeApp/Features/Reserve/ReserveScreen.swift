import SwiftUI

public struct ReserveScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = ReserveViewModel()
    
    public var body: some View {
        content
            .ignoresSafeArea()
    }
}

private extension ReserveScreen {
    private var content: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .spacing0) {
                tableMap
                    .frame(height: 575)
                
                Spacer(minLength: 36)
                    .fixedSize()
                
                restaurantInfo
                    .padding(.leading, 16)
                
                Spacer(minLength: 24)
                    .fixedSize()
                
                VStack(spacing: .spacing24) {
                    ReserveDetailRow(
                        title: "Seats",
                        icon: "person",
                        content: {
                            Stepper(count: $viewModel.state.numberOfPeople)
                        }
                    )
                    
                    ReserveDetailRow(
                        title: "Date",
                        icon: "calendar",
                        content: {
                            DatePicker(
                                "",
                                selection: $viewModel.state.date,
                                displayedComponents: .date
                            )
                        }
                    )
                    
                    ReserveDetailRow(
                        title: "Time",
                        icon: "clock",
                        content: {
                            DatePicker(
                                "",
                                selection: $viewModel.state.hours,
                                displayedComponents: .hourAndMinute
                            )
                        }
                    )
                    
                    Button(title: "Reserve") {
                        router.push(.reservesuccess)
                    }
                    .padding(.bottom, 16)
                }
                .padding(.horizontal, 16)                
                .padding(.bottom, 32)
            }
        }
    }
    
    private var tableMap: some View {
        ZStack {
            Color(.foodieGreen)
                .opacity(0.2)
            
            VStack(spacing: .spacing40) {
                HStack(spacing: .spacing24) {
                    timeCapsule(numberOfPeople: viewModel.state.numberOfPeople, time: "9:41")
                    
                    timeCapsule(numberOfPeople: viewModel.state.numberOfPeople, time: "19:00")
                }
                .padding(.top, 72)
                
                HStack(spacing: 72) {
                    table1
                        .button {
                            viewModel.send(event: .selectTable(id: 1))
                        }
                    table2
                        .button {
                            viewModel.send(event: .selectTable(id: 2))
                        }
                }
                
                HStack(spacing: 72) {
                    table3
                        .button {
                            viewModel.send(event: .selectTable(id: 3))
                        }
                    table4
                        .button {
                            viewModel.send(event: .selectTable(id: 4))
                        }
                }
                
                table5
                    .button {
                        viewModel.send(event: .selectTable(id: 5))
                    }
            }
        }
    }
    
    private var restaurantInfo: some View {
        VStack(alignment: .leading, spacing: .spacing12) {
            TextLabel(
                content: "Sandyq",
                color: .black,
                fontToken: .size24,
                style: .regular
            )
            
            HStack(spacing: .spacing64) {
                VStack(alignment: .leading, spacing: .spacing8) {
                    restaurantInfoItem(icon: "location", title: "1.4 km")
                    
                    restaurantInfoItem(icon: "fork.knife", title: "Kazakh")
                }
                
                VStack(alignment: .leading, spacing: .spacing8) {
                    restaurantInfoItem(icon: "star", title: "5.0")
                    
                    restaurantInfoItem(icon: "clock", title: "11:00 - 23:00")
                }
            }
        }
    }
    
    private func restaurantInfoItem(
        icon: String,
        title: String
    ) -> some View {
        HStack(spacing: .spacing12) {
            Image(systemName: icon)
                .resizable()
                .frame(width: 16, height: 16)
            
            TextLabel(
                content: title,
                color: .black,
                fontToken: .size16,
                style: .semibold
            )
        }
    }
    
    private var table1: some View {
        RoundDiningTableView(
            isSelected: Binding(
                get: {
                    viewModel.state.isTableSelected(tableID: 1)
                },
                set: { _ in }
            ),
            isReserved: false,
            tableNumber: 1
        )
    }
    
    private var table2: some View {
        RoundDiningTableView(
            isSelected: Binding(
                get: {
                    viewModel.state.isTableSelected(tableID: 2)
                },
                set: { _ in }
            ),
            isReserved: true,
            tableNumber: 2
        )
    }
    
    private var table3: some View {
        RectangularDiningTableView(
            isSelected: Binding(
                get: {
                    viewModel.state.isTableSelected(tableID: 3)
                },
                set: { _ in }
            ),
            isReserved: false,
            tableNumber: 3
        )
    }
    
    private var table4: some View {
        RectangularDiningTableView(
            isSelected: Binding(
                get: {
                    viewModel.state.isTableSelected(tableID: 4)
                },
                set: { _ in }
            ),
            isReserved: false,
            tableNumber: 4
        )
    }
    
    private var table5: some View {
        RectangularDiningTableView(
            isSelected: Binding(
                get: {
                    viewModel.state.isTableSelected(tableID: 5)
                },
                set: { _ in }
            ),
            isReserved: false,
            tableNumber: 5,
            variant: .horizontal
        )
    }
    
    private func timeCapsule(numberOfPeople: Int, time: String) -> some View {
        HStack(spacing: .spacing4) {
            Image(systemName: "person")
                .foregroundColor(.black)
            
            TextLabel(
                content: "\(numberOfPeople)",
                color: .black,
                fontToken: .size17,
                style: .semibold
            )
            
            TextLabel(
                content: "•",
                color: .black,
                fontToken: .size17,
                style: .semibold
            )
            
            Image(systemName: "clock")
                .foregroundColor(.black)
            
            TextLabel(
                content: "\(time)",
                color: .black,
                fontToken: .size17,
                style: .semibold
            )
        }
        .background(
            RoundedRectangle(cornerRadius: 11)
                .fill(.white)
                .frame(width: 140, height: 32)
        )
        .frame(width: 140, height: 32)
        .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 2)
    }
}

struct ReserveScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReserveScreen()
    }
}
