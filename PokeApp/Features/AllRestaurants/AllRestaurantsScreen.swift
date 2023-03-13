//
//  AllRestaurantsScreen.swift
//  PokeApp
//
//  Created by Ayan Baktygaliyev on 3/10/23.
//
import Foundation
import SwiftUI

public struct AllRestaurantsScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = AllRestaurantsViewModel()
    
    @State
    private var query = ""
    
    public var body: some View {
        content
            .padding(.leading, 16)
    }
    
    private enum Constants {
        static let salesCardWidth: CGFloat = 343
        static let salesCardHeight: CGFloat = 164
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: .spacing16){
            
            headerView
            
            ScrollView {
                VStack(alignment: .leading, spacing: .spacing16) {
                    
                    TextLabel(
                        content: StringConstants.Home.restaurants,
                        color: .black,
                        fontToken: .size24,
                        style: .bold
                    )
                    
                    cuisinesSection
                    
                    allRestaurantsSection
                    
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
                    content: StringConstants.Home.yourLocation,
                    color: .foodieGreen,
                    fontToken: .size16,
                    style: .semibold
                )
            }
            
            Spacer()
            
            Logo(fontToken: .size20)
        }
    }
    
    private var cuisinesSection: some View {
        VStack(spacing: .spacing6) {
            HStack {
                TextLabel(
                    content: StringConstants.AllRestaurants.cuisines,
                    color: .black,
                    fontToken: .size16,
                    style: .semibold
                )
                
                Spacer()
                
                TextLabel(
                    content: StringConstants.AllRestaurants.seeAll,
                    color: .foodieGreen,
                    fontToken: .size13,
                    style: .semibold
                )
                .button {
                    print("See all")
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .spacing12) {
                    ForEach(0..<10) { index in
                        AllRestaurantsCuisineCard.stub()
                            .frame(width: 140, height: 200)
                            .padding(.trailing, index == 10 - 1 ? 16 : 0)
                    }
                }
            }
        }
    }
}

private var allRestaurantsSection: some View {
    VStack(spacing: .spacing6) {
            HStack {
                TextLabel(
                    content: StringConstants.AllRestaurants.allrestaurants,
                    color: .black,
                    fontToken: .size16,
                    style: .semibold
                )
                
                Spacer()
                
                TextLabel(
                    content: StringConstants.AllRestaurants.seeAll,
                    color: .foodieGreen,
                    fontToken: .size13,
                    style: .semibold
                )
                .button {
                    print("See all")
                }
            }
            
            Spacer()
            
            VStack(spacing: .spacing96) {
                ForEach(0..<10) { index in
                    AllRestaurantsListCard.stub()
                        .frame(width: 344, height: 160)
                        .padding(.trailing, index == 10 - 1 ? 16 : 0)
                }
            }
        

            

    }
}
    
struct AllRestaurantsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AllRestaurantsScreen()
    }
}
