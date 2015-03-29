//
//  GenericImageView.swift
//  DIT
//
//  Created by Stephen Fox on 29/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

class GenericImageView: UIImageView {
    
    var size: CGSize?
    
    
    class func loadImage(from url: NSURL) -> UIImage {
        var data = NSData(contentsOfURL: url)
        
        return UIImage(data: data!)!
    }

}
