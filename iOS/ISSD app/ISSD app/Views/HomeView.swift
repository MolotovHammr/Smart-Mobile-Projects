//
//  HomeView.swift
//  ISSD app
//
//  Created by Fleans Metsi on 28/09/2021.
//

import SwiftUI



struct HomeView: View {
    var body: some View{
        NavigationView{
            
            VStack{
                
                ZStack{
                    
                    VStack(alignment: .leading) {
                        
                        HStack{
                            Spacer()
                            
                            Text("Lent Items")
                                .font(.title2)
                            
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            Image(systemName: "arrow.right")
                            
                            Spacer()
                            
                        }
                        .padding(.top, 7.0)
                        
                        Spacer()
                        
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 12.0){
                            
                            Image("macbook-1999633_1280")
                                .renderingMode(.none)
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 132.0, height: 132.0).background(Color.gray).cornerRadius(10)
                            
                            Image("371-3710805_images-in-collection-page-transparent-background-arduino-uno.png")
                                .renderingMode(.none)
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 132.0, height: 132.0).background(Color.gray).cornerRadius(10)
                            
                            Image("istockphoto-1056473032-170667a")
                                .renderingMode(.none)
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 132.0, height: 132.0).background(Color.gray).cornerRadius(10)
                            
                            Image("44-alum-silver-sport-white-6s-nc")
                                .renderingMode(.none)
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 132.0, height: 132.0).background(Color.gray).cornerRadius(10)
                            
                        }
                        
                    }
                    
                }.frame(width: 500.0, height: 225.0).background(Color.blue)
                
                HStack{
                    Text("Suggested Items")
                        .font(.title2)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                    
                }.padding(.top, 10.0)
                
                ZStack{
                    
                    HStack(spacing: 12.0){
                        
                        Image("digital-camera-canon-eos-lens-flash")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 167.0, height: 208.0).cornerRadius(10)
                        
                        Image("istockphoto-1140888695-612x612")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 167.0, height: 208.0).cornerRadius(10)
                        
                    }
                    
                }
                
                HStack(alignment: .bottom){
                    
                    Spacer()
                    
                    Text("Cannon 450D")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, -10.0)
                    
                    Spacer()
                    
                    Text("Qt: 5")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    Text("Samsung VR")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    Text("Qt: 1")
                        .font(.subheadline)
                        .fontWeight(.thin)
                    
                    Spacer()
                }
                
                HStack(){
                    
                    Spacer()
                    
                    Text("#476943")
                        .fontWeight(.light)
                        .foregroundColor(.blue)
                        .offset(x:-100)
                    
                    Text("#854566")
                        .fontWeight(.light)
                        .foregroundColor(Color.blue)
                    
                    Spacer()
                    
                }
                
                Spacer()
                
            }.navigationTitle("ISSD")
            
        }
        
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
        
    }
}
