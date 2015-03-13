//
//  ViewController.swift
//  DIT
//
//  Created by Stephen Fox on 13/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    var parallaxView: ParrallaxView = ParrallaxView()
    
    var blueFilterImageView: UIImageView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Change the status bar to white
        self.setNeedsStatusBarAppearanceUpdate()
        
        // Initialize the blue filter overlay
        blueFilterImageView = UIImageView(frame: CGRectMake(0, 0, Screen.width, Screen.height))
        blueFilterImageView?.image = UIImage(named: "BlueFilter")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Call update() to update the parrallax view
        // incase the users location has changed
        parallaxView.update()
        
        self.view.addSubview(parallaxView)
        
        // Add this after parrallax effect so it is layered
        // above it
        self.view.addSubview(blueFilterImageView!)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }


}

