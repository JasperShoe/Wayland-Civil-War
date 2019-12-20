//
//  ViewController.swift
//  Wayland-Civil-War
//
//  Created by Jasper_Hsu on 12/5/19.
//  Copyright © 2019 HACS. All rights reserved.
//

import UIKit
import MapKit

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle: String, pinSubTitle: String, location: CLLocationCoordinate2D){
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}

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
        
        //Custom pins/Landmarks
        var landmarks: [customPin] = []
        var landmarkTitles: [String] = ["Town Hall", "Claypit Hill", "Happy Hollow"]
        var landmarkSubTitles: [String] = ["Capital of Wayland", "Northie Children Hub", "Artur Went To School Here xD"]
        var landmarkLocation: [CLLocationCoordinate2D] = [CLLocationCoordinate2D(latitude: 42.361400, longitude: -71.361549), CLLocationCoordinate2D(latitude: 42.373079, longitude: -71.344808), CLLocationCoordinate2D(latitude: 42.337595, longitude: -71.369744)]
                        
        print(landmarkTitles.count)
        print(landmarkSubTitles.count)
        print(landmarkLocation.count)

        
        for n in 0...landmarkTitles.count-1 {
            landmarks.append(customPin(pinTitle: landmarkTitles[n], pinSubTitle: landmarkSubTitles[n], location: landmarkLocation[n]))
        }
        
        for landmark in landmarks {
            mapView.addAnnotation(landmark)
        }
    }
}

extension ViewController: CLLocationManagerDelegate {

}
