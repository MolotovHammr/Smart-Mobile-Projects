//
//  ItemDetailView.swift
//  ISSD app
//
//  Created by Nazar Bachynksyy on 28/09/2021.
//

import SwiftUI

struct ItemDetailView: View {
    
    @State var item: Item
    var body: some View {
        VStack{
            ScrollView{
            Rectangle().frame(width: .infinity, height: 400)
            HStack(spacing: 0){
                VStack(alignment: .leading, spacing: 2){
                    HStack {
                        Text(item.Omschrijving).font(.title)
                        Spacer()
                        Text("Qt: \(item.Aantal)").font(.title2)
                    }//HStack top text description
                    Text("#\(item.Barcode)").padding(2).foregroundColor(accentTextColor)
                }.frame(width: .infinity, height: .infinity)//VStack Description
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: 100)//HStack Description
            HStack{
                VStack{
                    Text("Available at:").font(.title2).padding(2)
                    HStack{
                        Spacer()
                        Text("R10").font(.title3)
                        Spacer()
                        Text("Strijp TQ").font(.title3)
                        Spacer()
                        Text("Tilburg").font(.title3)
                        Spacer()
                    }.padding(10)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.").multilineTextAlignment(.center)
                    }

                }
            }
            Button("Reserve This Item") {
                print("Tapped")
            }.frame(maxWidth: 340, maxHeight: 50).font(.title).padding(4).background(Color.black).foregroundColor(.white).cornerRadius(4)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top).navigationTitle(Text("#\(item.Barcode)").foregroundColor(accentTextColor)).navigationBarTitleDisplayMode(.inline)//VStack ItemDetailView
        
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: items[0])
    }
}
