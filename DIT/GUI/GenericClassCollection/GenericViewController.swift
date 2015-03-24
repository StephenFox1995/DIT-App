//
//  GenericViewController.swift
//  DIT
//
//  Created by Stephen Fox on 15/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// This is the super class for all UIViewControllers
// for this application.
//
// Any subclass of this will receive a backgroundView
// which provides an image of the campus the user is currently at
// and a blue filter overlay.
class GenericViewController: UIViewController {
    
    var font: Font = Font()
    
    // Background view to provide the blue overlay and parrallax image
    var backgroundView: BackgroundView = BackgroundView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change the status bar to white as to make the app pretty
        self.setNeedsStatusBarAppearanceUpdate()
        
        
        // Setup the navigation bar
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: font.getFont(.AvenirNext, fontStyle: .Regular, size: 20),
            NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBar"), forBarMetrics: .Default)
        self.navigationController?.navigationBar.translucent = false
        
        
        self.view.addSubview(backgroundView)
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        backgroundView.update()
    }
    
    
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
