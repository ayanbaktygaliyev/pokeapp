import SwiftUI

public struct ProfileScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = ProfileScreenViewModel()
    
    public var body: some View {
        content
            .padding(.leading, 16)
    }
    
    private var content: some View {
        VStack(alignment: .leading){
            
            ProfileCard.stub()
                .padding(.top, 30)
            
            accountSettings
            
            moreSettings
            
            Spacer(minLength: 265)
                .fixedSize()
            
            logOutButton
            
        }
    }
    
    private var logOutButton: some View{
        ZStack(alignment: .center){
            Rectangle()
                .fill(.gray)
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
                .frame(width: 327, height: 99)
                .cornerRadius(11)
                .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 2)
            VStack(spacing: 20){
                
                HStack{
                    
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
                    
                    Spacer()
                        .fixedSize()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color(.black))
                        .frame(width: 7, height: 14)
                        .padding(.leading, 145)
                    
                }
                
                HStack{
                    
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
                    
                    Spacer()
                        .fixedSize()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color(.black))
                        .frame(width: 7, height: 14)
                        .padding(.leading, 145)
                    
                }

                
                
            }
            
            
        }
    }
    
    private var accountSettings: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .fill(.white)
                .frame(width: 327, height: 70)
                .cornerRadius(11)
                .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 2)
            
            HStack{
                
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .foregroundColor(Color(.black))
                    .frame(width: 24, height: 24)
                    .padding(.leading, 23)
                
                TextLabel(
                    content: "Account settings",
                    color: .black,
                    fontToken: .size17,
                    style: .regular
                )
                .padding(.leading, 18)
                
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .foregroundColor(Color(.black))
                    .frame(width: 19, height: 19)
                    .padding(.leading, 76)
                
            }
            .padding(.top, 10)
            
        }
    
    }
}
    


    

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
