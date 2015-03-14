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
    var parrallaxView: ParrallaxView = ParrallaxView()
    
    var blueFilterImageView: UIImageView?
    
    // Constructor
    override init() {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height))
        
        // Initialize the blue filter overlay
        blueFilterImageView = UIImageView(frame: CGRectMake(0, 0, Screen.width, Screen.height))
        blueFilterImageView?.image = UIImage(named: "BlueFilter")
        
        self.addSubview(parrallaxView)
        self.addSubview(blueFilterImageView!)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Call this method to update any member of this view
    func update() {
        
        // Call update() to update the parrallax view
        // incase the users location has changed
        parrallaxView.update()

    }

}
