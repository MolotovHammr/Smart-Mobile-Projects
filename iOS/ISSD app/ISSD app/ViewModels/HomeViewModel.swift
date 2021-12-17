//
//  HomeViewModel.swift
//  ISSD app
//
//  Created by Nazar Bachynksyy on 28/09/2021.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var catalogItem: [Item] = Bundle.main.decode("items.json")
    @Published var currentItem: [Item] = []
    
    @Published var searchText: String = ""
    
    
    
}
