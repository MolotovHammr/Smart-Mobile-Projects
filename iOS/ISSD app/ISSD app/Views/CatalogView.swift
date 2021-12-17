//
//  CatalogView.swift
//  ISSD app
//
//  Created by Nazar Bachynksyy on 24/09/2021.
//

import SwiftUI

struct CatalogView: View {
    
    @State var searchString = ""
    
    let colums: [GridItem] = [GridItem(), GridItem()]
    var body: some View {
        NavigationView{
            VStack{
            SearchBarView(searchText: $searchString)
            ScrollView(.vertical){
                LazyVGrid(columns: colums, spacing: 5){
                    ForEach(items){item in
                        NavigationLink(destination: ItemDetailView(item: item), label: {CatalogItemView(item: item)}).buttonStyle(PlainButtonStyle())
                    }//Foreach Items
                }// LazyVGrid
            }.navigationTitle("Catalog").frame(width: .infinity, height: 620)//ScrollView
        
            }
        }// Nav view
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}

