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
    
    var font: Font = Font()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "News"
        
        // Setup the navigation bar
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: font.getFont(.AvenirNext, fontStyle: .Regular, size: 20),
            NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBar"), forBarMetrics: .Default)
        self.navigationController?.navigationBar.translucent = false
        
        
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
    
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as GenericCollectionViewCell
        
        // Set the attributes of the collection view cell
        cell.setCell("NewsTest", title: "Aungier Street")
        cell.addAction(Selector("presentView"), target: self)
        
        return cell
    }
    
    
    
    // MARK: Actions
    func presentView() {
        var view: NewsArticleView = NewsArticleView()
        
        view.present(self, animated: true)
    }
}
