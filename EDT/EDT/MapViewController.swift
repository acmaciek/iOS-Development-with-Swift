//
//  MapViewController.swift
//  EDT
//
//  Created by Maciek Girek on 3/27/18.
//  Copyright © 2018 Maciek Girek. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()
    let annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        annotation.title = "Chicago EDT"
        annotation.subtitle = "Come to the far garage door in the southeast corner of the parking lot. If the door next to it isn’t open, just knock on the garage door"
        //41.867881, -87.645469
        //new coordinates 41.868082, -87.645434
        annotation.coordinate = CLLocationCoordinate2D(latitude: 41.868082, longitude: -87.645434)
        map.addAnnotation(annotation)
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let center = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        map.setRegion(region, animated: true)
        
        map.showsUserLocation = true
    }
}
