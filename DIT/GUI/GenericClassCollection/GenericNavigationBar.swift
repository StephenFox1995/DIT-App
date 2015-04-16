//
//  GenericNavigationBar.swift
//  DIT
//
//  Created by Stephen Fox on 21/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// Generic navigation bar which can be used across
// the application
class GenericNavigationBar: UINavigationBar {
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: 80))
        
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
