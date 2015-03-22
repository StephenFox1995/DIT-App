//
//  NewsArticleView.swift
//  DIT
//
//  Created by Stephen Fox on 21/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// This class presents a NewsArticleView, which will display
// - News Title
// - News Article
// - News Image (Used as the background for the story)
class NewsArticleView: UIView {
    
    
    private var visualEffectView: VisualEffectView?
    private var imageForBackground: UIImageView?
    private var textView: GenericTextView?
    private var title: ExpandableLabel?
    private var font: Font = Font()
    
   
    
    override init() {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height))
        self.backgroundColor = UIColor.clearColor()
        
        // Add a visual effect view to diplay the article on.
        visualEffectView = VisualEffectView(frame: frame, withBlur: true, withVibrancy: false)
        
        // Set up the textview for the article
        textView = GenericTextView(frame: CGRect(x: 0, y: 70, width: Screen.width, height: Screen.height))

        
        // Set up the title for the article
        title = ExpandableLabel(frame: CGRect(x: 0, y: 0, width: Screen.width, height: 70), amountToExpand: 20)
        title?.numberOfLines = 0
        title?.adjustsFontSizeToFitWidth = true
        title?.textColor = UIColor.whiteColor()
        title?.font = font.getFont(.AvenirNext, fontStyle: .Bold, size: 30)
        
        
        
        self.addSubview(visualEffectView!)
        self.visualEffectView?.addContentToBlurView(textView!)
        self.addSubview(title!)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: Set attrributes for the news story
    
    // Sets the article for the news story
    // @param article
    func setArticleText(article: String) {
        self.textView?.text(article)
    }
    
    
    
    
    // Sets the title for the article
    // @param title
    func setArticleTitle(title: String) {
        self.title?.text = title
    }
    
    
    
    
    // Sets the background image for the article story
    // @param name - Name of the image to set
    func setArticleImage(name: String) {
        self.visualEffectView?.addBackgroundImage(name)
    }
    
    
    
    
    
    // MARK: Present NewsArticleView
    
    
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
            fatalError("Cannot present NewsArticleView.")
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
        }
    
    }
}
