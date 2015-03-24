//
//  GenericCollectionViewController.swift
//  DIT
//
//  Created by Stephen Fox on 20/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit



// Base class for any Collection View Used in this application

// Any subclass of this will receive a backgroundView
// which provides an image of the campus the user is currently at
// and a blue filter overlay.
class GenericCollectionView: UICollectionView {
    
    override init() {
        var flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: Screen.width, height: 181)
        flowLayout.scrollDirection = .Vertical
        
        super.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height), collectionViewLayout: flowLayout)
        
        self.backgroundColor = UIColor.clearColor()
        
    }
    
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

