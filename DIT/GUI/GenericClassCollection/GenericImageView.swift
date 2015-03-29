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
    
    
    // Loads an image from a URL.
    // If the image is successfully gotten i.e the user is connected
    // to Wifi/Data, it will be return to the reciever.
    // If the image cannot be recieved it will return a UIImage() Object
    // with no image.
    class func loadImage(from url: NSURL) -> UIImage {
        
        var data = NSData(contentsOfURL: url)
        
        if(data != nil) {
            return UIImage(data: data!)!
        } else {
            return UIImage()
        }
        
    }

}
