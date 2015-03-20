//
//  GenericCollectionViewController.swift
//  DIT
//
//  Created by Stephen Fox on 20/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit



// Parent for any Collection View Used in this application

// Any subclass of this will receive a backgroundView
// which provides an image of the campus the user is currently at
// and a blue filter overlay.
class GenericCollectionViewController: UICollectionViewController {
    
    // Re-use Identfier for cells
    let reuseIdentifier = "cell"
    
    var backgroundView: BackgroundView = BackgroundView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.addSubview(backgroundView)

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        // Change the status bar to white to make the app pretty
        self.setNeedsStatusBarAppearanceUpdate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        // Update background view incase user has moved location
        self.backgroundView.update()
    }
    
    
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    


    // MARK: UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 0
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as UICollectionViewCell
    
        return cell
    }
}
