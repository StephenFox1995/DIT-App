//
//  Colour.swift
//  DIT
//
//  Created by Stephen Fox on 15/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit


// Read-only static properties for colours used a lot across the app.
class Colour {
    
    class var transparentColour: UIColor {
        get { return UIColor(red: 0, green: 0, blue: 0, alpha: 0) }
    }
}
