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
    var title: String?
    
    
    override init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    }
    

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func addAction(action: Selector, target: AnyObject) {
        
    }
}
