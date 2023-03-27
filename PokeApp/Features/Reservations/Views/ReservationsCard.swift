import SwiftUI

struct ReservationsCard: View {
    let imageName: String
    let restaurantName: String
    let numOfPeople: Int
    let time: String
    let tableNumber: Int
    let address: String
    
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
                    Image(imageName)
                        .resizable()
                        .frame(width: 343, height: 164)
                        .cornerRadius(15)
                        .brightness(-0.16)

                    likeButton
                }
                
                TextLabel(
                    content: restaurantName,
                    color: .white,
                    fontToken: .size27,
                    style: .semibold
                )
                .padding(.bottom, 12)
                .padding(.leading, 16)
            }
            
            
            Spacer(minLength: 7)
                .fixedSize()
            
            
            .padding(.leading, 12)
            
            HStack (spacing: .spacing50){
                
                numberOfPeopleView
                
                TimeView
                
                TableView
                
            }
            
            
            Spacer(minLength: 16)
                .fixedSize()
            
            AddressView
            
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
                content: "\(numOfPeople)",
                color: .black,
                fontToken: .size15,
                style: .semibold
            )
        }
    }
    
    private var TimeView: some View {
        HStack(spacing: .spacing4) {
            Image(asset: .clock)
                .resizable()
                .frame(width: 18, height: 17)
                .padding(.leading, 16)
            
            Spacer(minLength: 6)
                .fixedSize()
            
            TextLabel(
                content: time,
                color: .black,
                fontToken: .size15,
                style: .semibold
            )
        }
    }
    
    private var TableView: some View {
        HStack(spacing: .spacing4) {
            Image(asset: .table)
                .resizable()
                .frame(width: 23, height: 17)
                .padding(.leading, 16)
            
            Spacer(minLength: 6)
                .fixedSize()
            
            TextLabel(
                content: "\(tableNumber)",
                color: .black,
                fontToken: .size15,
                style: .semibold
            )
        }
    }
    
    private var AddressView: some View {
        HStack(spacing: .spacing4) {
            Image(asset: .location)
                .resizable()
                .frame(width: 19, height: 21)
                .padding(.leading, 16)
            
            Spacer(minLength: 6)
                .fixedSize()
            
            TextLabel(
                content: address,
                color: .black,
                fontToken: .size15,
                style: .semibold
            )
        }
    }
    
    private var likeButton: some View {
        ZStack {
            Circle()
                .fill(.black.opacity(0.48))
                .frame(width: 32, height: 32)
                .padding(.trailing, 8)
                .padding(.top, 8)
            
            Image(asset: .system(.favorites))
                .resizable()
                .foregroundColor(Color(.foodieGreen))
                .frame(width: 20, height: 18)
                .padding(.trailing, 8)
                .padding(.top, 10)
                .button {
                    print("Liked")
                }
        }
    }
}


extension ReservationsCard {
    static func stub() -> Self {
        ReservationsCard(
            imageName: "test",
            restaurantName: "Seoul Food",
            numOfPeople: 2,
            time: "19:30",
            tableNumber: 34,
            address: "Tauke khan ave, 170/4"
        )
    }
}

struct ReservationsCard_Previews: PreviewProvider {
    static var previews: some View {
        ReservationsCard.stub()
    }
}
