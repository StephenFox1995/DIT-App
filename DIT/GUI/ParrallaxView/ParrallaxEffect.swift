//
//  ParrallaxEffect.swift
//  DIT
//
//  Created by Stephen Fox on 14/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

enum ParrallaxType: Int {
    case Horizontal
    case Vertical
    case Both
}


class ParrallaxEffect: NSObject {
    
    // Tilt value
    var parrallaxEffectRelativeValue: CGFloat = 10
    
    // Group of motions that can be implemented
    private var motionEffectGroup: UIMotionEffectGroup = UIMotionEffectGroup()
    
    override init() {
    }
    
    
    // Implements a parrallax effect on a view
    // 
    // @param target: The class/ view you want to implement the effect on
    // @param relativeValue: The movement offset for the view
    // @param type: The type of parrallax effect to be set for the target
    func addEffect(target: UIView, relativeValue: CGFloat, type: ParrallaxType) {
        
        // Set the min & max tilt values for the parrallax effect
        parrallaxEffectRelativeValue = relativeValue
        
        
        // Set up the appropriate parallax effect type
        switch (type) {
        case .Both:
            setHorizontalAndVerticalParrallaxEffect()
            break
            
        case .Horizontal:
            setHorizontalEffect()
            break
            
        case .Vertical:
            setVerticalEffect()
            break
        }
        
        // Add motion effect group to the view (target)
        target.addMotionEffect(self.motionEffectGroup)
    }
    
    
    
    
    // Sets up horizontal parrallax effect
    private func setHorizontalEffect() {
        
        var horizontalMoionEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        
        // Set the tilt value
        horizontalMoionEffect.minimumRelativeValue = -parrallaxEffectRelativeValue
        horizontalMoionEffect.maximumRelativeValue = parrallaxEffectRelativeValue
        
        // Add the motion to motionEffectGroup
        self.addMotion(horizontalMoionEffect)
    }
    
    
    
    
    // Sets up vetical parrallax effect
    private func setVerticalEffect() {
        var verticalMotionEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        
        // Set the tilt value
        verticalMotionEffect.minimumRelativeValue = -parrallaxEffectRelativeValue
        verticalMotionEffect.maximumRelativeValue = parrallaxEffectRelativeValue
        
        // Add the motion to the motionEffectGroup
        addMotion(verticalMotionEffect)
        
    }
    
    
    
    
    // Sets parrallax type for both horizontal & vertical tilts
    private func setHorizontalAndVerticalParrallaxEffect() {
        
        // Set up both type of effects
        self.setHorizontalEffect()
        self.setVerticalEffect()
        
    }
    
    
    
    
    // @param effect: Append a new motion effect to an array of effects
    private func addMotion(effect: UIInterpolatingMotionEffect){
        self.motionEffectGroup.motionEffects = []
        self.motionEffectGroup.motionEffects.append(effect)
    }
    
}
