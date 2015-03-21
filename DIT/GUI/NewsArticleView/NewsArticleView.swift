//
//  NewsArticleView.swift
//  DIT
//
//  Created by Stephen Fox on 21/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

class NewsArticleView: UIView {
    
    
    private var visualEffectView: UIVisualEffectView?
    private var imageForBackground: UIImageView?
    private var textView: UITextView?
    
    override init() {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height))
        self.backgroundColor = UIColor.clearColor()
        
        
        // Setup the blue effect for this view
        visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        visualEffectView?.frame = CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height)
        
        imageForBackground = UIImageView(frame: CGRectMake(0, 0, Screen.width, Screen.height))
        imageForBackground?.image = UIImage(named: "newsTest2")
        
        textView = UITextView(frame: CGRect(x: 0, y: 20, width: Screen.width, height: Screen.height))
        textView!.text = "Lorem ipsum, hello my name is Johny J. I would Ket on the side with lots of bass in the side of my ear"
        textView!.textColor = UIColor.whiteColor()
        textView!.backgroundColor = UIColor.clearColor()


        self.addSubview(imageForBackground!)
        self.addSubview(visualEffectView!)
        self.addSubview(textView!)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Present this view
    // @param onView - View whic his responsible to presenting
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
            target.view.userInteractionEnabled = false
        }
        else {
            fatalError("Cannot present NewsArticleView.")
        }
        
        

        if(animated) {
            
            // Set this views frame just off the scren so it can animated upwards
            self.frame = CGRect(x: 0, y: Screen.height, width: Screen.height, height: Screen.height)
            
            
            UIView.animateWithDuration(0.3,
                delay: 0.0,
                options: UIViewAnimationOptions.CurveEaseInOut,
                animations: {self.frame = CGRectMake(0, 0, Screen.width, Screen.height)},
                completion: nil )
        }
    
    }
    
    



}
