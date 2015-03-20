//
//  ContentView.swift
//  DIT
//
//  Created by Stephen Fox on 15/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit


// Any object that uses this protocol will be informed
// which button has been pressed and therefore
// which viewController to present.
protocol ContentViewDelegate {
    
    // @param viewController - String corresponding to the View Controller
    // to present.
    func viewControllerToPresent(viewController: String)
}



// Content View is the view where all the home screens icons
// are displayed from and added to.
class ContentView: UIView {
    
    
    let xib: NSArray = NSBundle.mainBundle().loadNibNamed("ContentView", owner: nil, options: nil)
    
    var delegate: ContentViewDelegate?
    
    override init() {
        super.init(frame: CGRect())
      
        
        let view = (xib[0] as UIView)
        
        // Change colour to transparent as its blue
        // interface builder.
        view.backgroundColor = UIColor.blackColor()
        
        self.addSubview(view)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    // MARK: Implement protocol methods here to tell the
    // any conforming class which View Controller to present
    @IBAction func displayMapsView(sender: AnyObject) {
        println("Maps")
        self.delegate?.viewControllerToPresent("Maps")
    }
    
    
    // Display Courses
    @IBAction func displayCoursesView(sender: AnyObject) {
    }
    
    // Display News View
    @IBAction func displayNewsView(sender: AnyObject) {
    }
    
    
    // Display Contacts View
    @IBAction func displayContactsView(sender: AnyObject) {
    }
}