//
//  ContactInformationView.swift
//  DIT
//
//  Created by Stephen Fox on 28/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

class ContactInformationView: UIView {
    

    convenience init() {
        self.init()
        var visualEffect = VisualEffectView(frame: self.frame, withBlur: true, withVibrancy: false, style: .Dark)
        self.frame = CGRectMake(0, 0, 300, 300)
        self.layer.cornerRadius = 8.0
        self.backgroundColor = UIColor.whiteColor()
        self.addSubview(visualEffect)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
