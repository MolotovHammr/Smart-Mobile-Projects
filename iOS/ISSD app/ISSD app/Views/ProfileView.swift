//
//  ProfileView.swift
//  ISSD app
//
//  Created by Nazar Bachynksyy on 29/09/2021.
//

import SwiftUI

struct ProfileView: View {
    var body: some View{
        
        NavigationView{
            
            VStack(alignment: .leading){
                
                HStack{
                    
                    Text("Student Info")
                        .font(.headline)
                        .fontWeight(.thin)
                        .multilineTextAlignment(.leading)
                    
                } .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Divider()
                
                HStack {
                    
                    Text("My Items")
                        .font(.headline)
                        .fontWeight(.thin)
                        .multilineTextAlignment(.leading)
                    
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Divider()
                
                HStack {
                    
                    Text("Reservation History")
                        .font(.body)
                        .fontWeight(.thin)
                        .multilineTextAlignment(.leading)
                    
                } .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
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
                    
                }.navigationTitle("My Profile")
                
                Spacer()
                
            }
            
        }
        
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
                .preferredColorScheme(.dark)
        }
    }
}
