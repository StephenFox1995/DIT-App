//
//  Parrallax.swift
//  DIT
//
//  Created by Stephen Fox on 13/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit



// Implements a Parrallax Effect on a view

// By default the class constructs a view with a parrallex effect.
// The view also has an image attribute that is determined by the users current campus location
class ParrallaxView: UIView {
    
    
    // Collection of all campus image names,
    private var campusImageNames: [String] = ["KevinStreet", "AungierStreet", "BoltonStreet", "Grangegorman", "CathalBrughaStreet"]
    
    // Image associated with the parallax view
    private var image: UIImage?
    
    // Check for the current campus the user is located
    // so we can change the image for this classes view
    private var currentCampus: Campus?
    
    private var location: Location?
    
    
    var parrallaxEffectRelativeValue: CGFloat = 15
    
    
    
    // - Constructs a view which is full screen size
    // - Sets up a parrallax effect
    override init() {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height))
        
        // Get the current campus the user is situated at
        currentCampus = Location.getCurrentCampus()
        
        // Add campus image
        self.addImageToView(forLocation: currentCampus!)
        
        
        // Setup parrallax effect on view
        self.setUpParrallaxEffect()
    }
    
    
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    
    // Call this function to update the parrallax view, incase the
    // user has moved from one campus to another, or has left a campus
    func update() {
        
        // Get the current campus the user is situated at
        currentCampus = Location.getCurrentCampus()
        
        self.addImageToView(forLocation: currentCampus!)

    }
    
    
    
    
    private func addImageToView(forLocation campus: Campus) {
        
        // Set the image origins outside of the screen so the images
        // edges don't appear on the screen when parrallax effect is 
        // in action.
        // Set the width and height slightly bigger to also accommodate
        // the parrallax effect
        var campusImageView: UIImageView = UIImageView(frame: CGRectMake(
            -parrallaxEffectRelativeValue,
            -parrallaxEffectRelativeValue,
            Screen.width + parrallaxEffectRelativeValue * 2,
            Screen.height + parrallaxEffectRelativeValue * 2
            ))
        
        
        var campusImage: UIImage?
        
        // Determine what image to display
        switch (campus) {
            
        case .KevinStreet:
            campusImage = UIImage(named: campusImageNames[0])
            break;
            
        case .AungierStreet:
            campusImage = UIImage(named: campusImageNames[1])
            break;
            
            
        case .BoltonStreet:
            campusImage = UIImage(named: campusImageNames[2])
            break;
            
        case .GrangeGorman:
            campusImage = UIImage(named: campusImageNames[3])
            break;
            
            
        case .CathalBrughaStreet:
            campusImage = UIImage(named: campusImageNames[4])
            break;
            
        case .None:
            campusImage = UIImage(named: campusImageNames[5])
            break;
            
        default:
            // Use default image, if somehow deaults
            campusImage = UIImage(named: campusImageNames[5])
            break;
        }
        
        
        // Add campus image to the image view
        campusImageView.image = campusImage!
        
        
        // Add campusImageView to view
        self.addSubview(campusImageView)
    }
    
    
    
    
    // Creates parrallax effect for this view
    private func setUpParrallaxEffect() {
        
        // Setup tilt effect on horizontal axis
        var verticalMotionEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        
        // Constrain effect
        verticalMotionEffect.minimumRelativeValue = -parrallaxEffectRelativeValue
        verticalMotionEffect.maximumRelativeValue = parrallaxEffectRelativeValue
        
        // Set the horizontal effect
        var horizontalMotionEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        
        // Contrain effect
        horizontalMotionEffect.minimumRelativeValue = -parrallaxEffectRelativeValue
        horizontalMotionEffect.maximumRelativeValue = parrallaxEffectRelativeValue
        
        
        // Create a group so they can be used together
        var motionEffectGroup: UIMotionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [verticalMotionEffect, horizontalMotionEffect]
        
        
        // Add motion effect group to the view
        self.addMotionEffect(motionEffectGroup)
    }
    
    
    
    
        
}
