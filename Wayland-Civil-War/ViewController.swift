//
//  ViewController.swift
//  Wayland-Civil-War
//
//  Created by Jasper_Hsu on 12/5/19.
//  Copyright © 2019 HACS. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let wayland = CLLocation(latitude: 42.3626, longitude: -71.3614)
        let regionRadius = 2000.0
        let region = MKCoordinateRegion(center: wayland.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)

        mapView.setRegion(region, animated: true)

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
}

extension ViewController: CLLocationManagerDelegate {

}
