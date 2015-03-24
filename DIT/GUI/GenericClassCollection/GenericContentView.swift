//
//  GenericContentView.swift
//  DIT
//
//  Created by Stephen Fox on 24/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit


protocol GenericContentViewDelegate {
    func contentViewHasAppeared(appeared: Bool)
}

// Provides a view which has
// - background image/ with blur
//
class GenericContentView: UIView, GenericContentViewDelegate {

    var visualEffectView: VisualEffectView?
    var imageForBackground: UIImageView?
    var font: Font = Font()
    
    var delegate: GenericContentViewDelegate?
    
    
    override init() {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height))
        
        self.backgroundColor = UIColor.clearColor()
        
        // Add a visual effect view to diplay the content on.
        visualEffectView = VisualEffectView(frame: frame, withBlur: true, withVibrancy: false, style: .Dark)
        
        
        self.addSubview(visualEffectView!)
    }

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // Sets the background image which will be 
    // used as a visual effect
    // @param name - Name of the image to set
    func setImage(name: String) {
        self.visualEffectView?.addBackgroundImage(name)
    }
    
    
    
    // Call this method, to add a dismiss button
    // in the navigation bar to dismiss this view
    func contentViewHasAppeared(appeared: Bool) {
    }
    
    
    // MARK: Present Generic Content View
    
    
    // Present this view
    // @param onView - View which his responsible to presenting
    // @prama animated - Animate presentation
    func present(target: AnyObject, animated: Bool) {
        
        // As its not full known what object will
        // want to present this view we should
        // check too see if we can use the target object to
        // present it.
        //
        // From this app we will only want to present from a
        // UIViewController, thus UIViewController is the
        // only object we check for in the downcast of
        // AnyObject
        // Any other object that wants to present this view
        // will raise an exception
        if let target = target as? UIViewController {
            
            target as UIViewController
            
            // Add this view to targets view object
            target.view.addSubview(self)
            
            // Turn off user interaction for the target view
            target.view.userInteractionEnabled = true
        }
        else {
            fatalError("Cannot present view.")
        }
        
        
        
        if(animated) {
            
            // Set this views frame just off the scren so it can animated upwards
            self.frame = CGRect(x: 0, y: Screen.height, width: Screen.height, height: Screen.height)
            
            // Animate view into parent view
            UIView.animateWithDuration(0.5,
                delay: 0.0,
                usingSpringWithDamping: 3.5,
                initialSpringVelocity: 0.2,
                options: UIViewAnimationOptions.CurveEaseInOut,
                animations: {self.frame = CGRectMake(0, 0, Screen.width, Screen.height)} ,
                completion: nil)
            
            // Send to any conforming object that this view is now
            // in the view hierarchy, it is their responsibility
            // on how the view is dismissed
            self.delegate?.contentViewHasAppeared(true)
        }
        
    }

}
