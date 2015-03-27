//
//  Location.swift
//  DIT
//
//  Created by Stephen Fox on 13/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

enum Campus: Int {
    case KevinStreet
    case AungierStreet
    case BoltonStreet
    case GrangeGorman
    case CathalBrughaStreet
    case None // If the user isn't at a campus
}



// Use to access the users current location
class Location: NSObject, CLLocationManagerDelegate {

    var currentCampus: Campus?
    private var locationManager: CLLocationManager?
    
    override init() {
        super.init()
        // Set up location manager

        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        locationManager?.delegate = self
        
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.requestAlwaysAuthorization()
    }
    
    
    
    
    // Returns an enumeration value associated with the 
    // current campus the user is situated at.
    func getCurrentCampus() -> Campus {


        
        if(CLLocationManager.locationServicesEnabled()) {
            
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest

        }
        
        return Campus.KevinStreet
    }
    
    
    
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var locationCoordinates: CLLocationCoordinate2D = manager.location.coordinate
        println(locationCoordinates)
    }
    
}
