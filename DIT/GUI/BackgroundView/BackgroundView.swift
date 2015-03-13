//
//  BackgroundView.swift
//  DIT
//
//  Created by Stephen Fox on 13/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// This class defines the view i.e the background to be used for 
// all ViewController's view property
class BackgroundView: UIView {
    
 
    // View used for parrallax effect, with image of current campus user is at.
    var parrallaxView: ParrallaxView?
    
    // Constructor
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height))
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
