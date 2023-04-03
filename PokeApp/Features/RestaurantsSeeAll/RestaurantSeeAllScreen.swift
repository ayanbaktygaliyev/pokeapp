import SwiftUI

public struct RestaurantSeeAllScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = RestaurantSeeAllViewModel()
    
    public var body: some View {
        content
            .padding(.leading, 16)
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: .spacing16){
            
            headerView
                .padding(.trailing, 16)
            
            topicView
            
            ScrollView {
                VStack(alignment: .leading, spacing: .spacing16) {
                    
                    Spacer()
                        .fixedSize()
                    
                    restaurantsSection
                }
            }
        }
    }
    
    private var headerView: some View {
        HStack {
            HStack {
                Image(asset: .locationPin)
                    .resizable()
                    .frame(width: 20, height: 27)
                
                TextLabel(
                    content: StringConstants.App.yourLocation,
                    color: .foodieGreen,
                    fontToken: .size16,
                    style: .semibold
                )
            }
            
            Spacer()
            
            Logo(fontToken: .size20)
        }
    }
    
    private var topicView: some View {
        HStack(alignment: .bottom){
            
            ZStack {
                Circle()
                    .fill(.black.opacity(0.48))
                    .frame(width: 32, height: 32)
                
                Image(systemName: "chevron.left")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 8, height: 12)
            }            .button {
                router.pop()
            }
            
            Spacer()
                .fixedSize()
            
            TextLabel(
                content: StringConstants.RestaurantSeeAll.recommended,
                color: .black,
                fontToken: .size24,
                style: .bold
            )
            .padding(.leading, 10)
            
        }
    }
    
    private var restaurantsSection: some View {
        VStack(spacing: .spacing6) {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: .spacing12) {
                    ForEach(0..<10) { index in
                        RestaurantCard.stub()
                    }
                }
            }
            .padding(.trailing, 16)
        }
    }
}

struct RestaurantSeeAllScreen_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSeeAllScreen()
    }
}
