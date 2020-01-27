//
//  ViewController.swift
//  Wayland-Civil-War
//
//  Created by Jasper_Hsu on 12/5/19.
//  Copyright © 2019 HACS. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase
import Firebase
import FirebaseFirestore


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
    
    var base:DatabaseReference!
    let locationManager = CLLocationManager()
    var numbers = [Int]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    var pitch = CGFloat(70)
    var altitude = CLLocationDistance(200)
    
    override func viewDidLoad() {

    
        

        
        super.viewDidLoad()
        base = Database.database().reference().child("numbers")
        base!.observe(DataEventType.value, with: {(snapshot) in
            print("Fix 1")
            for numbers in snapshot.children.allObjects as![DataSnapshot]{
                print("Numbers:")
                print(numbers.value as? [String: AnyObject])
            }
    print("Snapshot:")
    print(snapshot)
        })

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
    

        
    }

    extension MapViewController: MKMapViewDelegate {
        
        
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
