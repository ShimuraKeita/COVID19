//
//  MapView.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/05.
//

import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {

    @Binding var countryData: [CountryData]
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        var allAnnotations: [CoronaCaseAnnotation] = []
        
        for data in countryData {
            
            let title = data.country
                + "\n 確認者数" + "_" + data.confirmad.formatNumber() + "人"
                + "\n 死者数" + "_" + data.deaths.formatNumber() + "人"
            
            let coodinate = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
            
            allAnnotations.append(CoronaCaseAnnotation(title: title, coordinate: coodinate))
        }
        
        uiView.annotations.forEach { uiView.removeAnnotation($0) }
        uiView.addAnnotations(allAnnotations)
        
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }
}

class CoronaCaseAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
