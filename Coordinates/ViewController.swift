//
//  ViewController.swift
//  Coordinates
//
//  Created by Stephen Cheng on 2017-09-23.
//  Copyright © 2017 Stephen Cheng. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateCoordinates(_ sender: UIButton) {
        print("You pressed the button")
        var locValue: CLLocationCoordinate2D!
        locValue = locationManager.location?.coordinate
        latitudeLabel.text = locValue.latitude.description
        longitudeLabel.text = locValue.longitude.description
    }
    
}

