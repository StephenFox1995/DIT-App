//
//  Location.swift
//  DIT
//
//  Created by Stephen Fox on 13/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit


enum Campus: Int {
    case KevinStreet
    case AungierStreet
    case BoltonStreet
    case GrangeGorman
    case CathalBrughaStreet
    
    // If the user isn't at a campus
    case None
}


// Use to access the users current location
class Location {

    var currentCampus: Campus?
    
    // Returns an enumeration value associated with
    class func getCurrentCampus() -> Campus {
        return Campus.AungierStreet
    }
}
