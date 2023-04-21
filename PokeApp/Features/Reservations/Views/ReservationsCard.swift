import SwiftUI

struct ReservationsCard: View {
    let reservationResponse: ReservationResponse
    
    var body: some View {
        content
            .cornerRadius(15)
            .background(
                Color(.white)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
            )
    }
    
    private var content: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading){
                ZStack(alignment: .topTrailing) {
                    CachedAsyncImage(
                        url: reservationResponse.restaurant.imageURL,
                        content: { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 343, height: 164)
                                .cornerRadius(15)
                                .brightness(-0.16)
                        },
                        placeholder: {
                            FoodiePlaceholderImage()
                                .frame(width: 343, height: 164)
                                .cornerRadius(15)
                                .brightness(-0.16)
                        }
                    )
                }
                
                TextLabel(
                    content: reservationResponse.restaurant.name,
                    color: .white,
                    fontToken: .size27,
                    style: .semibold
                )
                .padding(.bottom, 12)
                .padding(.leading, 16)
            }
            
            
            Spacer(minLength: 7)
                .fixedSize()
            
            HStack(spacing: .spacing50) {
                numberOfPeopleView
                
                timeView
                
                tableView
            }
            
            Spacer(minLength: 16)
                .fixedSize()
            
            addressView
            
            Spacer(minLength: 16)
                .fixedSize()
            
        }
    }
    
    
    private var numberOfPeopleView: some View {
        HStack(spacing: .spacing4) {
            Image(asset: .person)
                .resizable()
                .frame(width: 28, height: 15)
                .padding(.leading, 16)
            
            Spacer(minLength: 6)
                .fixedSize()
            
            TextLabel(
                content: "\(reservationResponse.reservation.personas)",
                color: .black,
                fontToken: .size15,
                style: .semibold
            )
        }
    }
    
    private var timeView: some View {
        HStack(spacing: .spacing4) {
            Image(asset: .clock)
                .resizable()
                .frame(width: 18, height: 17)
                .padding(.leading, 16)
            
            Spacer(minLength: 6)
                .fixedSize()
            
            TextLabel(
                content: Dates.hoursAndMinutes(string: reservationResponse.reservation.reservationStart),
                color: .black,
                fontToken: .size15,
                style: .semibold
            )
        }
    }
    
    private var tableView: some View {
        HStack(spacing: .spacing4) {
            Image(asset: .table)
                .resizable()
                .frame(width: 23, height: 17)
                .padding(.leading, 16)
            
            Spacer(minLength: 6)
                .fixedSize()
            
            TextLabel(
                content: "4",
                color: .black,
                fontToken: .size15,
                style: .semibold
            )
        }
    }
    
    private var addressView: some View {
        HStack(spacing: .spacing4) {
            Image(asset: .location)
                .resizable()
                .frame(width: 19, height: 21)
                .padding(.leading, 16)
            
            Spacer(minLength: 6)
                .fixedSize()
            
            TextLabel(
                content: reservationResponse.restaurant.address,
                color: .black,
                fontToken: .size15,
                style: .semibold
            )
        }
    }
}
