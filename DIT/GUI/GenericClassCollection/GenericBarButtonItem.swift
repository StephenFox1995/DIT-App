//
//  CustomBarButton.swift
//  DIT Timetable
//
//  Created by Timothy Barnard on 05/02/2015.
//  Created by Stephen Fox on 15/04/2015
//  Copyright (c) 2015 Stephen Fox. All rights reserved.


import UIKit


// As trying to resize bar buttons items with custom images
// is somewhat of a pain, use this class to assign it the image
// you want and then customize UIImage however you want.
// Also add a target and action for the button too.
class GenericBarButtonItem: UIBarButtonItem {
    
    var customButton: UIButton?
    
    init(title: String) {
        super.init()
        self.title = title
    }
    
    init(imageName: String, target: AnyObject?, action: Selector) {
        super.init()
        self.customButton = UIButton(frame: CGRectMake(0, 0, 25, 25))
        self.customButton?.setBackgroundImage(UIImage(named: imageName), forState: UIControlState.Normal)
        self.customButton?.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        self.customView = customButton
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

