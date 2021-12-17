//
//  CatalogItemView.swift
//  ISSD app
//
//  Created by Nazar Bachynksyy on 27/09/2021.
//

import SwiftUI

struct CatalogItemView: View {
    var item: Item
    var body: some View{
        VStack(spacing: 0){
                Rectangle().frame(width: 200, height: 240)
        
                VStack(alignment: .leading){
                    HStack{
                        Text(item.Omschrijving).multilineTextAlignment(.leading).font(.footnote)
                        Spacer()
                        Text("Qt: \(item.Aantal)")
                    }
                    Text("#\(item.Barcode)")
                        .foregroundColor(accentTextColor)
                        .font(.footnote)
                }.frame(width: 200, height: 60)// Vstack Text
            }.frame(width: 200, height: 300)//Vstack item
        }
}

struct CatalogItemView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogItemView(item: items[0]).previewLayout(.fixed(width: 200, height: 300)).padding().background(colorBackground)
    }
}
