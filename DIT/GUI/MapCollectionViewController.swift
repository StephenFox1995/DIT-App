//
//  MapCollectionViewController.swift
//  DIT
//
//  Created by Stephen Fox on 18/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit


// Shows collection of all campuses of DIT
class MapCollectionViewController: GenericViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    let identifier = "cell"
    var collectionView: GenericCollectionView = GenericCollectionView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = false
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: identifier)

        self.view.addSubview(collectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as UICollectionViewCell
        cell.contentView.backgroundColor = UIColor.whiteColor()
        return cell
    }
}
