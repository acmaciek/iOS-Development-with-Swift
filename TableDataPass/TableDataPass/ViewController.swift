//
//  ViewController.swift
//  TableDataPass
//
//  Created by Maciek Girek on 5/31/17.
//  Copyright © 2017 Maciek Girek. All rights reserved.
//  AIzaSyCHBaqFeIn-6gPNf0srtnaNQ8wQUm1fuGc
import GoogleMaps
import UIKit

class ViewController: UIViewController {
  
  var mapView: GMSMapView?
  var userLatitude = CLLocationDegrees()
  var userLongitude = CLLocationDegrees()
  var userLocation = String()
  var userAddress = String()
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    GMSServices.provideAPIKey("AIzaSyCHBaqFeIn-6gPNf0srtnaNQ8wQUm1fuGc")
    let camera = GMSCameraPosition.camera(withLatitude: userLatitude, longitude: userLongitude, zoom: 15.0)
    let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    view = mapView
    
    // Creates a marker in the center of the map.
    let marker = GMSMarker()
    marker.position = CLLocationCoordinate2D(latitude: userLatitude, longitude: userLongitude)
    marker.title = userLocation
    marker.snippet = userAddress
    marker.map = mapView
  }
}

