//
//  Screen.swift
//  DIT
//
//  Created by Stephen Fox on 13/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// Information for the screen properties
class Screen: UIView {
    
    
    
    
    // Return the width of the screen (read-only)
    internal class var width: CGFloat {
        get { return UIScreen.mainScreen().bounds.size.width }
    }
    
    
    
    
    // Return the height of the screen. (read-only)
    internal class var height: CGFloat {
        get { return UIScreen.mainScreen().bounds.size.height }
    }
    
    
    
    
    // Return half screen width. (read-only)
    internal class var halfWidth: CGFloat {
        get { return (UIScreen.mainScreen().bounds.size.width / 2 )}
    }
    
    
    
    
    // Return half screen height. (read-only)
    internal class var halfHeight: CGFloat {
        get { return (UIScreen.mainScreen().bounds.size.height / 2) }
    }

}
