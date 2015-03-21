//
//  ExpandableLabel.swift
//  DIT
//
//  Created by Stephen Fox on 21/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit


// A label which can expand and contract
// to show more or less content
class ExpandableLabel: UILabel {

    private var expanded: Bool = false
    private var button: UIButton?
    private var expandableAmount: CGFloat?
    
    
    
    init(frame: CGRect, amountToExpand: CGFloat) {
        super.init(frame: frame)
        
        self.expandableAmount = amountToExpand
        
        self.button = UIButton(frame: CGRect(origin: self.frame.origin, size: self.frame.size))
        self.button?.addTarget(self, action: Selector("buttonPress"), forControlEvents: .TouchUpInside)
        self.button?.backgroundColor = UIColor.clearColor()
        
        self.addSubview(button!)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func buttonPress() {
        if(expanded) {
            expand(self.expandableAmount!)
        } else {
            contract()
        }
    }
    
    // Exands the label
    // @param amount - Amount the label is to be expanded by
    func expand(amount: CGFloat) {

        self.expanded = true
        
        UIView.animateWithDuration(0.3,
            delay: 0.0,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: { self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height + amount)},
            completion: nil )
    }
    
    func contract() {
        self.expanded = false
    }
}
