import SwiftUI

struct ProfileCard: View {
    let imageName: String
    let userFullName: String
    let userEmail: String
    let numberOfNotifications: String
    
    var body: some View {
        content
    }
    
    private var content: some View {
        ZStack(alignment: .leading){
            
            Rectangle()
                .fill(.white)
                .frame(width: 327, height: 70)
                .cornerRadius(11)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            HStack(spacing: .spacing18){
                Circle()
                    .fill(Color(.foodieGreen))
                    .frame(width: 44, height: 44)
                    .padding(.leading, 24)
                
                VStack(alignment: .leading, spacing: 2){
                    TextLabel(
                        content: userFullName,
                        color: .black,
                        fontToken: .size16,
                        style: .semibold
                    )
                        
                    TextLabel(
                        content: userEmail,
                        color: .grey,
                        fontToken: .size10,
                        style: .semibold
                    )
                }
                
                Spacer()
                    .fixedSize()
                
                NotificationButton
            }
        }
    }
    
    private var NotificationButton: some View {
        ZStack(alignment: .topTrailing){
            ZStack {
                Circle()
                    .fill(.black.opacity(0.05))
                    .frame(width: 40, height: 40)
                
                
                Image(systemName: "bell")
                    .resizable()
                    .foregroundColor(Color(.black))
                    .frame(width: 17, height: 17)
                    .button {
                        print("notify")
                    }
            }
            
                Circle()
                    .fill(.red)
                    .frame(width: 12, height: 12)
            
                TextLabel(
                    content: numberOfNotifications,
                    color: .white,
                    fontToken: .size8,
                    style: .medium
                )
                .padding(.trailing, 3)
                .padding(.top, 1)
            
                
        }

    }
}

extension ProfileCard {
    static func stub() -> Self {
        ProfileCard(
            imageName: "test",
            userFullName: "Pokeapp Creator",
            userEmail: "foodie@nu.edu.kz",
            numberOfNotifications: "3"
        )
    }
}

struct ProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCard.stub()
    }
}
