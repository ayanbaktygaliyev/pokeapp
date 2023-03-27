//
//  AllRestaurantsScreen.swift
//  PokeApp
//
//  Created by Ayan Baktygaliyev on 3/10/23.
//
import Foundation
import SwiftUI

public struct ReservationsScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @StateObject
    private var viewModel = ReservationsViewModel()
    
    @State
    private var query = ""
    
    public var body: some View {
        content
            .padding(.leading, 16)
            .padding(.trailing, 12)
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
                        content: StringConstants.Reservations.reservations,
                        color: .black,
                        fontToken: .size24,
                        style: .bold
                    )
                    
                    ReservationsSection
                    
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
    
    
    private var ReservationsSection: some View {
        VStack(spacing: .spacing32) {
        
            Spacer()
            
            VStack(spacing: .spacing96) {
                ForEach(0..<1) { index in
                    ReservationsCard.stub()
                        .frame(width: 343, height: 164)
                        .padding(.trailing, index == 10 - 1 ? 16 : 0)
                }
            }
            
            
            
            
        }
    }
    
    struct ReservationsScreen_Previews: PreviewProvider {
        static var previews: some View {
            ReservationsScreen  ()
        }
    }
}
