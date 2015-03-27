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
        
        label.textColor = UIColor.blackColor()
        self.contentView.addSubview(label)
        

        
    }
    
    
    
    // Returns an appropriately sized label depending on contents of the label
    private func calculateSizeOfLabel(forText: String, fontSize: Int) -> UILabel {
        // 30 words per line
        var f: UIFont = UIFont(name: "Avenir Next", size: 25)!
        println("Font size:", f.pointSize)
        var characterCount = forText.characterCount()
        
        var lines = characterCount / 25
        
        // The height the label should be
        var height = lines * (fontSize * 3)
        
        // If the height of the label is greater than the height of the contentView, the contentView must 
        // be increased
        if((height as NSNumber).floatValue > (contentSize.height as NSNumber).floatValue) {
            var difference = (height as NSNumber).doubleValue - (contentSize.height as NSNumber).doubleValue
            
            self.increaseContentSize(CGSize(width: 0, height: difference))
        }
        
        // Convert height to CGFloat so we can construct new label size
        var heightCGFloatValue = CGFloat((height as NSNumber).floatValue)
        
        var label = UILabel(frame: CGRectMake(0, 0, Screen.width, heightCGFloatValue))
        
        
        // Set the text for the label
        label.text = forText
        label.font = font.getFont(.AvenirNext, fontStyle: .Regular, size: 25)
        
        label.numberOfLines = 0
        println(label)
        return label
    }
    
    
    
    
    // Increase the contentSize property of UIScrollView to accommodate any
    // additions to the view. If a new view needs to be added to the scroll view
    // this method should be called so the contentSize is updated.
    // @param amount - The amount the contentSize should be increased by
    private func increaseContentSize(amount: CGSize) {
        // The new height that needs to be added to the frame
        var newHeight = self.contentView.frame.height + amount.height
        
        // Increase the height of the content view to accomodate any subview that
        // has been added
        self.contentView.frame = CGRectMake(0, 0, Screen.width, newHeight)
        
        // Now increase the height of contentSize to fit the new size of contentView
        self.contentSize = self.contentView.frame.size
        
        println(contentSize)
        println(contentView)
    }

}


extension String {
    
    func characterCount() -> Int {
        return countElements(self)
    }
}


