//
//  GenericCollectionViewCell.swift
//  DIT
//
//  Created by Stephen Fox on 21/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// A generic collection view cell which can be used across
// the application
class GenericCollectionViewCell: UICollectionViewCell {
    
    
    var imageName: String?
    var title: UILabel?
    var button: UIButton?
    
    var width: CGFloat?
    var height: CGFloat?
    
    var font: Font = Font()

    
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 320, height: 181))

        
        self.width = self.frame.size.width
        self.height = self.frame.size.height
        self.contentView.backgroundColor = UIColor.blackColor()
        
        // Initialise the button
        self.button = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: width!,
            height: height!))
        
        
        // Init the title
        self.title = UILabel(frame: CGRect(
            x: 0,
            y: height! - 30,
            width: width!,
            height: 30))
        
        self.title?.textColor = UIColor.whiteColor()
        self.title?.backgroundColor = UIColor.blackColor()
        self.title?.font = font.getFont(AppFont.AvenirNext,
            fontStyle: FontStyle.Regular,
            size: 20)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // Set the cell with the following attributes
    // @param imageName - Name of the image to display
    // @param title - The title for the cell
    func setCell(imageName: String, title: String) {
        self.button?.setImage(UIImage(named: imageName), forState: .Normal)
        self.title?.text = title
        
        self.contentView.addSubview(self.button!)
        self.contentView.addSubview(self.title!)
    }
    
    
    
    // Add an action for this cell
    // @param action - Method to call
    // @param target - Object to call the method
    func addAction(action: Selector, target: AnyObject) {
        self.button?.addTarget(target, action: action, forControlEvents: .TouchUpInside)
    }
}
