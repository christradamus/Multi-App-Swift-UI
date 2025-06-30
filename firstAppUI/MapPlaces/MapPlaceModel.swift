//
//  MapPlaceModel.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 23-06-25.
//

import MapKit

struct MapPlaceModel: Identifiable, Codable {
    let id: UUID
    var name: String
    var codableCoordinates: CodableCoordinate
    var favorite: Bool

    var coordinates: CLLocationCoordinate2D {
        codableCoordinates.clLocationCoordinate
    }

    init(id: UUID = UUID(), name: String, coordinates: CLLocationCoordinate2D, favorite: Bool) {
        self.id = id
        self.name = name
        self.codableCoordinates = CodableCoordinate(from: coordinates)
        self.favorite = favorite
    }
}

struct CodableCoordinate: Codable {
    var latitude: Double
    var longitude: Double

    var clLocationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    init(from coordinate: CLLocationCoordinate2D) {
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
    }
}
