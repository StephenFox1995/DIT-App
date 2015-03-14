//
//  ViewController.swift
//  DIT
//
//  Created by Stephen Fox on 13/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    var backgroundView: BackgroundView = BackgroundView()
    
    var xib: NSArray = NSBundle.mainBundle().loadNibNamed("ContentView", owner: nil, options: nil)
    
    // This view is the view that displays all the icons
    var contentView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Change the status bar to white as to make the app pretty
        self.setNeedsStatusBarAppearanceUpdate()
        
        contentView = (xib[0] as UIView)
        contentView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        // Add background view
        self.view.addSubview(backgroundView)
        
        // Add content view
        self.view.addSubview(contentView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
       
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }


}

