//
//  VisualEffectView.swift
//  DIT
//
//  Created by Stephen Fox on 22/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit


// Creates a view with a UIVisualEffect
//
// This class contructs a UIView with a UIBlurEffect & UIVibrancyEffect. A vibrancy effect cannot be added on its own, it must have a blur effect in order to work. 
// So to add a vibrancy effect, both withBlur: & withVibrancy: must be true. A blur effect can however be on it's own. If a withBlur: false & withVibrancy: true, the
// view will not add any UIVisualEffect. You will simply be left with a blank view.
//
class VisualEffectView: UIView {

    // Blur effects
    private var visualBlurEffectView: UIVisualEffectView?
    private var blurEffect: UIBlurEffect?
    
    // Vibrancy Effects
    private var visualVibrancyEffectView: UIVisualEffectView?
    private var vibrancyEffect: UIVibrancyEffect?
    
    private var withBlur: Bool = false
    private var withVibrancy: Bool = false
    
    
    
    init(frame: CGRect, withBlur: Bool, withVibrancy: Bool, style: UIBlurEffectStyle) {
        super.init(frame: frame)
        
        self.withBlur = withBlur
        self.withVibrancy = withVibrancy
        
        
        // Both blur and vibrancy
        if(withBlur & withVibrancy) {
            self.addBlurEffect(style)
            self.addVibrancyEffect()
            
            // Add vibrancy effect view to the content view of the blur effect
            // as it cannot be on added without a blur effect
            visualBlurEffectView?.contentView.addSubview(visualVibrancyEffectView!)
        }
        // Blur on its own
        else if(withBlur & !withVibrancy) {
            self.addBlurEffect(style)
        }
    }
    
    
    
    
    
    
    
    // Adds a UIVisualEffectView with a UIBlurEffect
    func addBlurEffect(style: UIBlurEffectStyle) {
        
        // Construct blur effect
        self.blurEffect = UIBlurEffect(style: style)
        
        // Add blur effect to a visual effect view
        self.visualBlurEffectView = UIVisualEffectView(effect: blurEffect!)
        
        // Set the blur effect views size to the size of this view
        self.visualBlurEffectView?.frame = self.frame
        
        
        // Now add the BlurEffectView to this view
        self.addSubview(visualBlurEffectView!)
    }
    
    
    
    
    // Adds a UIVisualeffectView with a UIVibrancyEffect
    // which then gets added to the blurEffectView
    func addVibrancyEffect() {
        
        // MARK: Vibrancy effect Setup
        // Setup vibrancy effect on the desired blur effect
        self.vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect!)
        
        // Add the vibrancy effect to a vibrancy effect view
        self.visualVibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect!)
        
        // Set the frame size of the vibrancy effect.
        self.visualVibrancyEffectView!.frame = self.frame
    }
    
    
    
    
    // Adds content to the vibrancy view.
    // This view must have a visualVibrancyView for
    // any object to be added to it
    // If the content you want added to this view
    // needs a vibrancy effect, this method must be called.
    func addContentToVibrancyView(view: UIView) {
        if(withVibrancy) {
            self.visualVibrancyEffectView?.contentView.addSubview(view)
        }
    }
    
    // Adds content to the blur view.
    // This view must have a visualBlurView for
    // any object to be added to it
    func addContentToBlurView(view: UIView) {
        if(withBlur) {
            self.visualBlurEffectView?.contentView.addSubview(view)
        }
    }
    
    
    
    
    // Adds a background image for this view.
    // the background image will be covered by a blur effect
    func addBackgroundImage(image: String) {
        
        var backgroundImageView = UIImageView(frame: self.frame)
        var backgroundImage = UIImage(named: image)
        
        backgroundImageView.image = backgroundImage
        
        self.addSubview(backgroundImageView)
        
        // Send to the background
        self.sendSubviewToBack(backgroundImageView)
    }
    
    
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
