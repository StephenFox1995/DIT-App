//
//  BackgroundView.swift
//  DIT
//
//  Created by Stephen Fox on 13/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit


// Background view is the background that is used across the app.
// 
// It contains an image of the campus (with a parrallax effect)
// and a blue overlay.
class BackgroundView: UIView {
    
 
    // View used for parrallax effect, with image of current campus user is at.
    var parrallaxView: ParrallaxView = ParrallaxView()
    
    var blueFilterImageView: UIImageView?
    
    // Constructor
    override init() {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height))
        
        
        // Initialize the blue filter overlay
        blueFilterImageView = UIImageView(frame: CGRectMake(0, 0, Screen.width + 10, Screen.height + 10))
        blueFilterImageView?.image = UIImage(named: "BlueFilter")
        
        self.addSubview(parrallaxView)
        self.addSubview(blueFilterImageView!)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Call this method to update any member of this view
    func update() {
        
        // Call to update the parrallax view
        // incase the users location has changed
        parrallaxView.checkIfLocationNeedsUpdating()

    }
    
    

}
