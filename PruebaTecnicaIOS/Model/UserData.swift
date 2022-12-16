//
//  UserData.swift
//  PruebaTecnicaIOS
//
//  Created by Jeison Galeano on 16/12/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct UserData: Hashable, Codable, Identifiable {
        
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    struct Address: Hashable, Codable{
        var street: String
        var suite: String
        var city: String
        var zipcode: String
        var geo: Coordinates
        var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: (geo.lat as NSString).doubleValue,
                longitude: (geo.lng as NSString).doubleValue)
        }
    }
    var phone: String
    var website: String
    
   // private var imageName: String
    var image: Image {
        Image("chilkoottrail")
    }
    var company: Company
    struct Company: Hashable, Codable{
        var name: String
        var catchPhrase: String
        var bs: String
    }
   

    struct Coordinates: Hashable, Codable {
        var lat: String
        var lng: String
    }
}
