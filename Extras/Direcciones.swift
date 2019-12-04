//
//  Direcciones.swift
//  iOSJsonParsing
//
//  Created by Fernando Vargas Salas on 11/20/19.
//  Copyright © 2019 JournalDev. All rights reserved.
//
import Foundation
import MapKit
import Contacts
import AddressBook

class Direccion: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    let image: String
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D,image: String) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        self.image = image
        super.init()
    }
    
    init?(json: [Any]) {
        // 1
        if let title = json[1] as? String {
            self.title = title
        } else {
            self.title = "No Title"
        }
        // json[11] is the long description
        self.locationName = json[2] as! String
        self.image = json[5] as! String
        if let latitude = json[3] as? Double,
            let longitude = json[4] as? Double {
            self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        } else {
            self.coordinate = CLLocationCoordinate2D()
        }
    }
    
    var subtitle: String? {
        return locationName
    }
    
    var imageName: String? {
        if title == "Estacionamineto Tapatio" { return "Estacionamiento" }
        if title == "Baño para Padres" {return "Baño" }
        if title == "Canchas Basketball" {return "Basketball"}
        if title == "Estacionamiento Alberca" {return "Estacionamiento"}
        if title == "Alberca Olímpica Universitaria" {return "Alberca"}
        if title == "ENTRADA: Gradas Externas"{return "Puerta"}
        if title == "ENTRADA: Maratón" {return "Maratón"}
        if title == "ENTRADA: Puerta Jugadores"{return "Jugador"}
        
        if title == "Tapatio" {return "Tapatio"}
        if title == "Metro Universidad" {return "Metro"}
        if title == "Bloque A"{return "A"}
        if title == "Bloque B" {return "B"}
        if title == "Bloque C"{return "C"}
       
        return "Flag"
    }
    
    func mapItem() -> MKMapItem{
        let addressDictionary = [String(CNPostalAddressStreetKey): subtitle]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary as [String : Any])
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "\(String(describing: title))\(subtitle)"
        return mapItem
    }
    
}






