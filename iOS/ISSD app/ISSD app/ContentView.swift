//
//  ContentView.swift
//  ISSD app
//
//  Created by Nazar Bachynksyy on 16/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            
            HomeView().tabItem { Image(systemName: "house")
            }
            CatalogView().tabItem{ Image(systemName: "magnifyingglass")
            }
            MapView().tabItem { Image(systemName: "map")
            }
            ProfileView().tabItem { Image(systemName: "person")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
// === Navigation bar styling, might be useful later
//
//struct NavAppearanceModifier: ViewModifier {
//    init(backgroundColor: UIColor, foregroundColor: UIColor, tintColor: UIColor?, hideSeperator: Bool){
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.titleTextAttributes = [.foregroundColor: foregroundColor]
//        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
//        navBarAppearance.backgroundColor = backgroundColor
//        if hideSeperator{
//        navBarAppearance.shadowColor = .clear
//        }
//        UINavigationBar.appearance().standardAppearance = navBarAppearance
//        UINavigationBar.appearance().compactAppearance = navBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
//        if let tintColor = tintColor{
//        UINavigationBar.appearance().tintColor = tintColor
//
//        }
//
//    }
//    func body(content: Content) -> some View {
//        content
//    }
//}
//
//extension View{
//    func navigationAppearance(backgroundColor: UIColor, foregroundColor: UIColor, tintColor: UIColor? = nil, hideSeperator: Bool = false) -> some View{
//        self.modifier(NavAppearanceModifier(backgroundColor: backgroundColor, foregroundColor: foregroundColor, tintColor: tintColor, hideSeperator: hideSeperator))
//
//
//    }
//}
