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
    
    var pitch = CGFloat(70)
    var altitude = CLLocationDistance(200)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization()
        mapView.isUserInteractionEnabled=true
        view.isUserInteractionEnabled=true

        //Setting Pinch
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch(sender: )))
        mapView.addGestureRecognizer(pinchGesture)
        
        //Setting Map
        mapView.mapType = MKMapType.standard
        mapView.isPitchEnabled = true
        mapView.isRotateEnabled = true
        
        //Setting Camera
        let mapCamera = MKMapCamera()
        mapCamera.centerCoordinate = mapView.userLocation.coordinate
        mapCamera.pitch = pitch
        mapCamera.altitude = altitude
        mapView.camera = mapCamera
        
        //Custom Pins
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
        
        //geofence region WHS
        let geoFenceRegion:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(42.341907 , -71.374044), radius: 200, identifier: "WHS")
        
//        let circle = MKCircle(center: CLLocationCoordinate2DMake(42.341907, -71.374044), radius: 200)
        
        


        //User Location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            locationManager.startMonitoring(for: geoFenceRegion)
        }
        mapView.delegate = self
        
        //Tile Overlay
        configureTileOverlay()
        
    }
    
    
    


    //flagging entering/exiting region
    

    
    @objc func pinch(sender: UIPinchGestureRecognizer){
        var scale = sender.scale-1
        
        if(altitude >= 200 && scale > 0){
            altitude -= CLLocationDistance(scale*5)
        } else if(altitude <= 700 && scale < 0){
            altitude -= CLLocationDistance(scale*10)
        }

        mapView.camera.altitude = altitude
        mapView.camera.pitch = pitch
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
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entered \(region.identifier)")
        }
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Exited \(region.identifier)")
    }
}
