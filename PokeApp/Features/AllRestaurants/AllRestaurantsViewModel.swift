//
//  AllRestaurantsViewModel.swift
//  PokeApp
//
//  Created by Ayan Baktygaliyev on 3/10/23.
//

import Foundation
import SwiftUI

public class AllRestaurantsViewModel: ObservableObject {
    struct State {
        var username: String
        var password: String
    }
    
    @Published
    var state: State
    var filteredData = [Restaurant]()
    
    init() {
        self.state = State(username: "", password: "")
    }
    
    private(set) var data: [Restaurant] = [
       Restaurant(name: "Korean"),
    ]
    
    func search(with query: String){
        filteredData = query.isEmpty ? data : data.filter {$0.name.contains(query)}
    }
}

