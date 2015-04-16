//
//  GenericTextView.swift
//  DIT
//
//  Created by Stephen Fox on 21/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// A generic TextView which can be used across
// the application
class GenericTextView: UITextView {
    
    private var textViewFont: Font = Font()
    
    init(frame: CGRect) {
        super.init(frame: frame, textContainer: NSTextContainer())
        
        self.font = textViewFont.getFont(.AvenirNext, fontStyle: FontStyle.Regular, size: 20)
        self.textColor = UIColor.whiteColor()
        self.backgroundColor = UIColor.clearColor()
        self.scrollEnabled = true
        self.editable = false
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    
    // Sets the text for this view
    // @param text - The text for this view to display
    func addText(text: String) {
        self.text = text
    }

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
