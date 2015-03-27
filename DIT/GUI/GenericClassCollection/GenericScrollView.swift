//
//  GenericScrolView.swift
//  DIT
//
//  Created by Stephen Fox on 25/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

class GenericScrollView: UIScrollView, UIScrollViewDelegate{

    var contentView: UIView!
    var positions: [NSValue: NSValue] = [:]
    var labels: [UILabel] = []
    var images: [UIImageView] = []
    var font: Font = Font()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Set up scroll view
        self.delegate = self
        self.backgroundColor = UIColor.clearColor()
        self.scrollEnabled = true

        
        // Content view allows us to add more views to the scroll view
        self.contentView = UIView(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.heightWithNavigationBar))
        self.addSubview(contentView)
        
        // Set the content size be the same size as the content view. Adding content to contentView will increase contentSize.
        self.contentSize = contentView.frame.size
        
    }
    
      
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func addText(text: String, fontSize: Int) {
        var label: UILabel = calculateSizeOfLabel(text, fontSize: fontSize)
        
        label.textColor = UIColor.whiteColor()
        
        self.contentView.addSubview(label)
        
        
        
        
    }
    
    
    
    // Returns an appropriately sized label depending on contents of the label
    private func calculateSizeOfLabel(forText: String, fontSize: Int) -> UILabel {
        
        // Set the labels size to be as big as CGFloat.max, then call
        // sizeToFit() to scale appropriately with the text content
        var label = UILabel(frame: CGRectMake(0, 0, Screen.width, CGFloat.max))
        
        
        // Set the text for the label
        label.text = forText
        label.font = font.getFont(.AvenirNext, fontStyle: .Regular, size: 25)
        
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.numberOfLines = 0
        
        label.sizeToFit()
        
        
        var labelPosition = label.frame.origin.y
        var labelHeight = label.frame.size.height
        
        // Check to see if the content view needs to be resized in order to add this view
        if((labelPosition + labelHeight) > self.contentView.frame.height) {
            println(labelHeight)
            println(self.contentView.frame.height)
            self.increaseContentSize(label)
        }
        
        return label
    }
    
    
    
    
    // Increase the contentSize property of UIScrollView to accommodate any
    // additions to the view. If a new view needs to be added to the scroll view
    // this method should be called so the contentSize is updated.
    // @param amount - The amount the contentSize should be increased by
    private func increaseContentSize(view: UIView) {
        
        
        // Calculate the difference in height between the view to be added and content view
        var differenceInHeight = ((view.frame.origin.y + view.frame.size.height) - self.contentView.frame.size.height)
        
        // The new height that needs to be added to the frame
        var newHeight = self.contentView.frame.height + differenceInHeight
        
        // Increase the height of the content view to accomodate any subview that
        // has been added
        self.contentView.frame = CGRectMake(0, 0, Screen.width, newHeight)
        
        // Now increase the height of contentSize to fit the new size of contentView
        self.contentSize = self.contentView.frame.size
    }

}



