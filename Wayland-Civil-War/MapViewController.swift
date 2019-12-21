//
//  ViewController.swift
//  Wayland-Civil-War
//
//  Created by Jasper_Hsu on 12/5/19.
//  Copyright © 2019 HACS. All rights reserved.
//

import UIKit
import MapKit
import MapKitGoogleStyler

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

class MapViewController: UIViewController {
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        mapView.isUserInteractionEnabled=true
        view.isUserInteractionEnabled=true

        //ima try to make this shit 3d
        mapView.mapType = MKMapType.standard
        mapView.showsBuildings = true
        let mapCamera = MKMapCamera()
        mapCamera.centerCoordinate = mapView.userLocation.coordinate
        mapCamera.pitch = 70
        mapCamera.altitude = 500
        mapCamera.heading=45
        mapView.camera = mapCamera
        
        let wayland = CLLocation(latitude: 42.3626, longitude: -71.3614)
        let regionRadius = 2000.0
//        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius) //I set to user location
        let region = MKCoordinateRegion(center: wayland.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius) //I set to wayland location

//        mapView.setRegion(region, animated: true)
        mapView.showsScale=true
        


        //Custom pins/Landmarks
        var landmarks: [customPin] = []
        let landmarkTitles: [String] = ["Town Hall", "Claypit Hill", "Happy Hollow"]
        let landmarkSubTitles: [String] = ["Capital of Wayland", "East of the Mississippi", "*Some Funny Reference*"]
        let landmarkLocation: [CLLocationCoordinate2D] = [CLLocationCoordinate2D(latitude: 42.361400, longitude: -71.361549), CLLocationCoordinate2D(latitude: 42.373079, longitude: -71.344808), CLLocationCoordinate2D(latitude: 42.337595, longitude: -71.369744)]
                        
        for n in 0...landmarkTitles.count-1 {
            landmarks.append(customPin(pinTitle: landmarkTitles[n], pinSubTitle: landmarkSubTitles[n], location: landmarkLocation[n]))
        }
        
        for landmark in landmarks {
            mapView.addAnnotation(landmark)
        }
        mapView.isScrollEnabled=false; //disable scrolling
        mapView.isZoomEnabled=false; //disable zooming - Instead, toggle map pitch and altitude
        

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        mapView.delegate = self
        configureTileOverlay()

    }
    

    private func configureTileOverlay() {
            // We first need to have the path of the overlay configuration JSON
            guard let overlayFileURLString = Bundle.main.path(forResource: "overlay", ofType: "json") else {
                    return
            }
            let overlayFileURL = URL(fileURLWithPath: overlayFileURLString)
            
            // After that, you can create the tile overlay using MapKitGoogleStyler
            guard let tileOverlay = try? MapKitGoogleStyler.buildOverlay(with: overlayFileURL) else {
                return
            }
            
            // And finally add it to your MKMapView
        mapView.addOverlay(tileOverlay)

        }
        
    }

    extension MapViewController: MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            // This is the final step. This code can be copied and pasted into your project
            // without thinking on it so much. It simply instantiates a MKTileOverlayRenderer
            // for displaying the tile overlay.
            if let tileOverlay = overlay as? MKTileOverlay {
                return MKTileOverlayRenderer(tileOverlay: tileOverlay)
            } else {
                return MKOverlayRenderer(overlay: overlay)
            }
        }
        
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        mapView.setCenter(locations[0].coordinate, animated: true)
    }
    
}
