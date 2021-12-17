//
//  SearchBarView.swift
//  ISSD app
//
//  Created by Nazar Bachynksyy on 28/09/2021.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass").foregroundColor(searchText.isEmpty ? Color.black : Color.gray)
            TextField("Search by name of barcode...", text: $searchText).foregroundColor(Color.gray).overlay(
                Image(systemName:"xmark.circle.fill")
                    .padding(6)
                    .foregroundColor(Color.black)
                    .opacity(searchText.isEmpty ? 0.0 : 1.0)
                    .onTapGesture {
                        searchText = ""
                    }
                , alignment: .trailing)
            
            }.font(.headline)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20.0).fill(Color.white).shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 0)).padding(6).frame(width: .infinity, height: 60)
    }
    
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
