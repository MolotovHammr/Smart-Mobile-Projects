//
//  MapView.swift
//  ISSD app
//
//  Created by Fleans Metsi on 28/09/2021.
//


import SwiftUI
import MapKit



class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion()
    
    private let manager = CLLocationManager()
    
    override init() {
        
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locations.last.map {
            
            let center = CLLocationCoordinate2D(latitude: $0.coordinate.latitude,
                                                longitude: $0.coordinate.longitude)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.5,
                                        longitudeDelta: 0.5)
            
            region = MKCoordinateRegion(center: center,
                                        span: span)
       
        }
   
    }

}


struct City: Identifiable {
    
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
}

struct MapView: View {
    
    @StateObject private var manager = LocationManager()
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.4392648,
                                                                                  longitude: 5.478633),
                                                                                  span: MKCoordinateSpan(latitudeDelta: 0.1,
                                                                                                         longitudeDelta: 0.1))

       let annotations = [
        
           City(name: "Fontys R10", coordinate: CLLocationCoordinate2D(latitude: 51.45115875755905,
                                                                       longitude: 5.479667186737061)),
        
        
           City(name: "Fontys TQ", coordinate: CLLocationCoordinate2D(latitude: 51.45085119994589,
                                                                      longitude: 5.453402996063233)),
       ]

    var body: some View {
        
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: annotations) {
            
                   MapMarker(coordinate: $0.coordinate)
            
        }.ignoresSafeArea()
    
    }

}

struct MapView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MapView()
            .preferredColorScheme(.dark)
        
       }

  }




