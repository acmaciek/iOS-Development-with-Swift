//
//  destinations.swift
//  TableDataPass
//
//  Created by Maciek Girek on 5/31/17.
//  Copyright © 2017 Maciek Girek. All rights reserved.
//
import GoogleMaps
import Foundation

class VacationDestination: NSObject {
  var name: String
  var location: CLLocationCoordinate2D
  var zoom: Float
  
  init(name: String, location: CLLocationCoordinate2D, zoom: Float) {
    self.name = name
    self.location = location
    self.zoom = zoom
  }
}
