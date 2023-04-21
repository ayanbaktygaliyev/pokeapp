import SwiftUI

public struct ReserveScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @ObservedObject
    var viewModel: ReserveViewModel
    
    public var body: some View {
        content
            .ignoresSafeArea()
            .overlay(if: viewModel.state.isShowingDialog) {
                Dialog(
                    isShowingDialog: $viewModel.state.isShowingDialog,
                    title: StringConstants.App.error,
                    subtitle: "You cannot reserve a seat for \(viewModel.state.numberOfPeople) people.\nMake sure table capacity is enough for number of people.",
                    colorToken: .foodieGreen
                )
                .frame(width: UIScreen.main.bounds.width)
            }
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
                        viewModel.reserve {
                            router.push(.reservesuccess)
                        }
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
                    ZStack {
                        Circle()
                            .fill(.black.opacity(0.2))
                            .frame(width: 32, height: 32)
                        
                        Image(systemName: "chevron.left")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 8, height: 12)
                    }
                    .button {
                        router.pop()
                    }
                    
                    timeCapsule(numberOfPeople: viewModel.state.numberOfPeople, time: "9:41")
                    
                    timeCapsule(numberOfPeople: viewModel.state.numberOfPeople, time: "19:00")
                }
                .padding(.top, 72)
                
                if viewModel.state.tables.isEmpty {
                    VStack {
                        TextLabel(
                            content: "Oops, the restaurant does not have \nempty tables",
                            color: .black,
                            fontToken: .size36,
                            style: .medium
                        )
                        
                        Spacer()
                    }
                } else {
                    VStack {
                        ForEach(viewModel.state.tables) { table in
                            VStack(spacing: 0) {
                                RectangularDiningTableView(
                                    isSelected: Binding(
                                        get: {
                                            viewModel.state.isTableSelected(tableID: table.id)
                                        },
                                        set: { _ in }
                                    ),
                                    isReserved: table.status == "Occupied",
                                    tableNumber: table.seats,
                                    variant: .horizontal
                                )
                                .button {
                                    viewModel.send(event: .selectTable(id: table.id))
                                }
                                .disabled(table.status == "Occupied")
                                
                                Spacer(minLength: 24)
                                    .fixedSize()
                            }
                        }
                        
                        Spacer()
                    }
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
