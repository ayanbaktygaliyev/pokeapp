import SwiftUI

public struct ProfileScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = ProfileScreenViewModel()
    
    public var body: some View {
        content
    }
    
    private var content: some View {
        VStack(alignment: .center){
            ProfileCard.stub()

            Spacer(minLength: 90)
                .fixedSize()

            accountSettings

            moreSettings

            Spacer(minLength: 190)
                .fixedSize()

            logOutButton
                .button {
                    viewModel.logOut()
                    router.push(.signIn)
                }
        }
    }
    
    private var logOutButton: some View{
        ZStack(alignment: .center){
            Rectangle()
                .fill(Color(.foodieGreen))
                .frame(width: 343, height: 56)
                .cornerRadius(15)
            
            TextLabel(
                content: "Log Out",
                color: .white,
                fontToken: .size17,
                style: .medium
            )
        }
    }
    
    private var moreSettings: some View{
        ZStack(alignment: .leading){
            Rectangle()
                .fill(.white)
                .frame(width: 327, height: 150)
                .cornerRadius(11)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            VStack(alignment: .leading ,spacing: 20){
                HStack {
                    Image(systemName: "text.bubble")
                        .resizable()
                        .foregroundColor(Color(.black))
                        .frame(width: 24, height: 24)
                        .padding(.leading, 16)
                    
                    TextLabel(
                        content: "Feedback",
                        color: .black,
                        fontToken: .size17,
                        style: .regular
                    )
                    .padding(.leading, 18)
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color(.black))
                        .frame(width: 7, height: 14)
                        .padding(.trailing, 16)
                        .button {
                            router.push(.feedbackscreen)
                        }
                }
                
                HStack {
                    Image(systemName: "star")
                        .resizable()
                        .foregroundColor(Color(.black))
                        .frame(width: 24, height: 24)
                        .padding(.leading, 16)
                    
                    TextLabel(
                        content: "Favourites",
                        color: .black,
                        fontToken: .size17,
                        style: .regular
                    )
                    .padding(.leading, 18)
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color(.black))
                        .frame(width: 7, height: 14)
                        .padding(.trailing, 16)
                        .button {
                            router.push(
                                .seeAllRestaurants(title: "Favourites", restaurants: [])
                            )
                        }
                }
                
                HStack {
                    Image(systemName: "info.circle")
                        .resizable()
                        .foregroundColor(Color(.black))
                        .frame(width: 24, height: 24)
                        .padding(.leading, 16)
                    
                    TextLabel(
                        content: "About us",
                        color: .black,
                        fontToken: .size17,
                        style: .regular
                    )
                    .padding(.leading, 18)
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color(.black))
                        .frame(width: 7, height: 14)
                        .padding(.trailing, 16)
                        .button {
                            router.push(.aboutus)
                        }
                    
                }
                
            }
            .frame(width: 327)
        }
    }
    
    private var accountSettings: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .fill(.white)
                .frame(width: 327, height: 70)
                .cornerRadius(11)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            HStack{
                
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .foregroundColor(Color(.black))
                    .frame(width: 24, height: 24)
                    .padding(.leading, 16)
                
                TextLabel(
                    content: "Account settings",
                    color: .black,
                    fontToken: .size17,
                    style: .regular
                )
                .padding(.leading, 18)
                
                Spacer(minLength: 0)
                
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .foregroundColor(Color(.black))
                    .frame(width: 19, height: 19)
                    .padding(.trailing, 16)
                    .button {
                        router.push(.accountsettings)
                    }
                    
            }
            .frame(width: 327, alignment: .leading)
        }
    }
}
    
struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
