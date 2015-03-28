//
//  GenericScrolView.swift
//  DIT
//
//  Created by Stephen Fox on 25/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit


// A ScrollView class which automatically sizes, when content is added.
// Currently supports adding images and text.

class GenericScrollView: UIScrollView, UIGestureRecognizerDelegate{

    var contentView: UIView!
    var yPositions: [CGFloat] = []
    var labels: [UILabel] = []
    var images: [UIImageView] = []
    var font: Font = Font()
    var gesture: UILongPressGestureRecognizer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupLongPressGestureRecognizer()
        
        // Set up scroll view
        self.backgroundColor = UIColor.clearColor()
        self.scrollEnabled = true

        
        // Content view allows us to add more views to the scroll view
        self.contentView = UIView(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.heightWithNavigationBar))
        self.addSubview(contentView)
        
        // Set the content size be the same size as the content view. Adding content to contentView will increase contentSize.
        self.contentSize = contentView.frame.size
        
        // Add any new view from the last yPosition.
        // Initialise the first element to be 0
        yPositions.append(0)
        
    }
    
      
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func userHasTouchedScrollView() {
        if(self.contentOffset.y == 0) {
            println("Should move view")
        }
    }
    
    
    func setupLongPressGestureRecognizer() {
        self.gesture = UILongPressGestureRecognizer(target: self, action: Selector("userHasTouchedScrollView"))
        self.gesture.minimumPressDuration = 0.2
        gesture.delegate = self
        self.addGestureRecognizer(gesture)

    }
    
    
    // Adds text to the scroll view using a UILabel.
    // - Labels size is determined on the text content
    // - Its position is determined on any other content that is
    // currently in the scrolllView. If theres content it will be added
    // beneath that content.
    func addText(text: String, font: Font) {
        
        var label: UILabel = calculateSizeOfLabel(text, font: font)
        
        label.textColor = UIColor.whiteColor()
        
        self.contentView.addSubview(label)
    }
    
    
    
    func addImage(image: String) {
        var image = UIImage(named: image)
        var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 323, height: 181))
        
        imageView.image = image
        
        imageView.frame.origin.y = nextAvailablePosition()
        
        var imagePosition = imageView.frame.origin.y
        var imageHeight = imageView.frame.size.height
        
        if((imagePosition + imageHeight) > self.contentView.frame.height) {
            self.increaseContentSize(imageView)
        }
        
        
        self.recordPostition(imageView.frame.origin.y + imageView.frame.size.height)
        
        self.addSubview(imageView)
    }
    
    
    
    
    
    // Returns an appropriately sized label depending on contents of the label
    private func calculateSizeOfLabel(forText: String, font: Font) -> UILabel {
        
        // Set the labels size to be as big as CGFloat.max, then call
        // sizeToFit() to scale appropriately with the text content
        var label = UILabel(frame: CGRectMake(0, 0, Screen.width, CGFloat.max))

        // Set the text for the label
        label.text = forText
        label.font = font.getFont(.AvenirNext, fontStyle: font.style!, size: CGFloat(font.size!))
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.numberOfLines = 0
        
        
        label.sizeToFit()
        
        // Change the labels vertical positioning to wherever the next available
        // position is.
        label.frame.origin.y = nextAvailablePosition()
        
        
        var labelPosition = label.frame.origin.y
        var labelHeight = label.frame.size.height
        
        // Check to see if the content view needs to be resized in order to add this view
        if((labelPosition + labelHeight) > self.contentView.frame.height) {
            self.increaseContentSize(label)
        }
        
        // Record the position of this label so nothing can
        // be added over it
        self.recordPostition(labelPosition + labelHeight)
        
        return label
    }
    
    
    
    
    // Records the position of an object so no
    // object can be added over it
    private func recordPostition(position: CGFloat) {
        yPositions.append(position)
    }
    
    
    // Tells the receiver where in the view it can be located, vertically.
    private func nextAvailablePosition() -> CGFloat {
        return yPositions.last!
    }
    
    
    
    
    // Increase the contentSize property of UIScrollView to accommodate any
    // additions to the view. If a new view needs to be added to the scroll view
    // this method should be called so the contentSize is updated.
    // @param amount - The amount the contentSize should be increased by
    private func increaseContentSize(view: UIView) {
        
        
        // Calculate the difference in height between the view to be added and content view
        // We must calculate this from origin of the view to be added, as the difference in height between
        // contentView and the view to be added could be very small in the case it started at origin.y = 0
        // If it started at e.g. origin..y = 500, it's height will be much larger in comparison to contentView.
        // It is important to note this.
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



