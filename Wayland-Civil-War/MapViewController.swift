//
//  ViewController.swift
//  Wayland-Civil-War
//
//  Created by Jasper_Hsu on 12/5/19.
//  Copyright © 2019 HACS. All rights reserved.
//

import UIKit
import Mapbox

class MapViewController: UIViewController, MGLMapViewDelegate {
    
    @IBOutlet var mapView: MGLMapView!
    
    let camera = MGLMapCamera()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Setting up map view
        mapView.delegate = self
        mapView.setUserTrackingMode(.follow, animated: true)
        camera.pitch = 60
        mapView.setCamera(camera, animated: true)
    }
}
