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
    
    
    
    private var campusImages: [String] = ["KevinStreet", "Grangegorman", "AungierStreet", "BoltonStreet"]
    private var campusNames: [String] = ["Kevin Street", "Grange Gorman", "Aungier Street", "Bolton Street"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "MAPS"
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerClass(GenericCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        self.view.addSubview(collectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    
    
    
    // Return 9 cells as theres no
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as GenericCollectionViewCell
        
        cell.setCellImage(campusImages[indexPath.row])
        cell.setCellTitle(campusNames[indexPath.row])
        return cell
    }
    
}
