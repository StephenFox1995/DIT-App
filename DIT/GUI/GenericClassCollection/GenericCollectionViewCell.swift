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
    
    
    private var imageName: String?
    var imageView: UIImageView?
    private var title: UILabel?
    private var button: UIButton?
    
    var width: CGFloat?
    var height: CGFloat?
    
    
    
    private var yOffset: CGFloat?
    var offsetSpeed: CGFloat = 2.00

    
    private var font: Font = Font()
    
    // All images will be resized to this automatically
    private var imageWidthForCell = 320
    private var imageHeightForCell = 181

    
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 320, height: 190))

        
        self.width = self.frame.size.width
        self.height = self.frame.size.height
        
        // Add the cells content view to a visual effect view
        var visualEffectView = VisualEffectView(frame: self.frame, withBlur: true, withVibrancy: false, style: .Dark)
        visualEffectView.addContentToBlurView(self.contentView)
        
        self.addSubview(visualEffectView)

        
        // Initialise the button
        // The button will be overlaid on the 
        // imageview to give the effect the button
        // is actually the image
        self.button = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: width!,
            height: height!))
        
        self.button?.backgroundColor = UIColor.clearColor()
        
        
        
    }
    
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    // This will initiate a parrallax effect on the cell
    // anytime the user begins to scroll
    // The callee is responsible for determining when the user has scrolled
    // 
    // The image must be set before this function is called, otherwise
    // the appropriate information for offsetting the image cannot be gathered
    //
    // @param target The object to apply the parrallax effect to
    func initiateParrallaxEffect(offset: CGPoint) {
        // Determine the offset
        imageView?.frame.offset(dx: offset.x, dy: offset.y)
        
    }
    
    
    
    
    // Set the cells title
    // @param title - The title for the cell
    func setCellTitle(title: String) {

        
        // Init the title positioned inside the visual effect frame
        self.title = UILabel(frame: CGRectMake(0, self.height! - 40, Screen.width, 40))
        
        // Setup the title
        self.title?.textColor = UIColor.whiteColor()
        self.title?.font = font.getFont(AppFont.AvenirNext,
            fontStyle: FontStyle.Regular,
            size: 20)
        
        self.title?.text = title
        
        
        self.contentView.addSubview(self.title!)
        self.contentView.bringSubviewToFront(self.title!)
    }
    
    
    
    
    // @param name - Name of the image
    func setCellImage(name: String) {
        self.imageView = UIImageView(frame: CGRectMake(0, 0, self.width!, self.height! - 40))
        self.imageView?.center.x = self.center.x
        
        // The button will be overlaid to give effect
        // that the image is a button
        self.button = UIButton(frame: CGRectMake(0, 0, self.width!, self.height!))

        
        var image = UIImage(named: name)
        self.imageView?.image = image
        
        self.contentView.addSubview(imageView!)
        self.contentView.addSubview(button!)
        
    }
    
    
    
    // Add an action for this cell
    // @param action - Method to call
    // @param target - Object to call the method
    func addAction(action: Selector, target: AnyObject) {
        self.button?.addTarget(target, action: action, forControlEvents: .TouchUpInside)
    }
}
