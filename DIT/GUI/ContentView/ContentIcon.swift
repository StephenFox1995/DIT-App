//
//  ContentIcon.swift
//  DIT
//
//  Created by Stephen Fox on 13/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit


class ContentIcon: UIView {
    
    var iconImageView: UIImageView?
    var iconTitle: String?
    
    init(imageName: String, title: String) {
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
