import SwiftUI

public struct AccountSettingsScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = AccountSettingsScreenViewModel()
    

    
    public var body: some View {
        
        content
            .padding(.leading, 16)
    }
    
    private var content: some View {
        VStack(alignment: .leading){
            
            greeting

            Spacer(minLength: 70)
                .fixedSize()
            
            TextLabel(
                content: "Account settings",
                color: .black,
                fontToken: .size20,
                style: .bold
            )
            
            Spacer(minLength: 35)
                .fixedSize()

            moreSettings

            Spacer(minLength: 265)
                .fixedSize()

            logOutButton
            
        }
    }
    
    private var greeting: some View{
        TextLabel(
            content: "Hi, PokeApp Creator!",
            color: .black,
            fontToken: .size24,
            style: .bold
        )
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
                .frame(width: 327, height: 202)
                .cornerRadius(11)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            VStack(alignment: .center ,spacing: 23){
                
                HStack{
                    
                    TextLabel(
                        content: "Username",
                        color: .black,
                        fontToken: .size17,
                        style: .regular
                    )
                    .padding(.leading, 18)
                    
                    Spacer(minLength: 0)
                    
                    TextLabel(
                        content: "pokeapp",
                        color: .black,
                        fontToken: .size17,
                        style: .bold
                    )
                    .frame(alignment: .trailing)
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color(.black))
                        .frame(width: 7, height: 14)
                        .padding(.trailing, 16)
                    
                }
                
//                Line()
//                    .stroke(style: StrokeStyle(lineWidth: 1))
//                    .foregroundColor(Color(.dashLine))
//                    .frame(width: 310, height: 0.1, alignment: .center)
                
                HStack{
                    
                    TextLabel(
                        content: "Full name",
                        color: .black,
                        fontToken: .size17,
                        style: .regular
                    )
                    .padding(.leading, 18)
                    
                    Spacer(minLength: 0)
                    
                    TextLabel(
                        content: "Pokeapp creator",
                        color: .black,
                        fontToken: .size17,
                        style: .bold
                    )
                    .frame(alignment: .trailing)
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color(.black))
                        .frame(width: 7, height: 14)
                        .padding(.trailing, 16)
                    
                }
                
                HStack{
                    
                    TextLabel(
                        content: "Phone Number",
                        color: .black,
                        fontToken: .size17,
                        style: .regular
                    )
                    .padding(.leading, 18)
                    
                    Spacer(minLength: 0)
                    
                    TextLabel(
                        content: "87471445192",
                        color: .black,
                        fontToken: .size17,
                        style: .bold
                    )
                    .frame(alignment: .trailing)
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color(.black))
                        .frame(width: 7, height: 14)
                        .padding(.trailing, 16)
                    
                }
                
                HStack{
                    
                    TextLabel(
                        content: "Password",
                        color: .black,
                        fontToken: .size17,
                        style: .regular
                    )
                    .padding(.leading, 18)
                    
                    Spacer(minLength: 0)
                    
                    TextLabel(
                        content: "*********",
                        color: .black,
                        fontToken: .size17,
                        style: .bold
                    )
                    .frame(alignment: .trailing)
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color(.black))
                        .frame(width: 7, height: 14)
                        .padding(.trailing, 16)
                    
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
                        print("Edit Account Settings")
                    }
                    
            }
            .frame(width: 327, alignment: .leading)
            
            
            
        }
    
    }
}
    


    

struct AccountSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsScreen()
    }
}
