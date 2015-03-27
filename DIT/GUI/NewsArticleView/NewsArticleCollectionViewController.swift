//
//  NewsArticleCollectionViewController.swift
//  DIT
//
//  Created by Stephen Fox on 22/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// Class which shows a collection of news stories.
class NewsArticleCollectionViewController: GenericViewController, GenericContentViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var cell: GenericCollectionViewCell?
    private var identifier = "cell"
    private var collectionView: GenericCollectionView = GenericCollectionView()
    


    
    private var images: [String] = ["NewsTest7", "NewsTest6", "NewsTest5", "NewsTest4"]
    private var titles: [String] = ["News News", "More News", "More News News", "More News News News"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        self.navigationItem.title = "NEWS"
        
        // Setup collectionView
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerClass(GenericCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        self.view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        cell = (collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as GenericCollectionViewCell)
        
        // Set the attributes of the collection view cell
        cell!.setCellImage(images[indexPath.row])
        cell!.setCellTitle(titles[indexPath.row])
        
        cell!.addAction(Selector("presentNewsArticleView"), target: self)
        
        return cell!
    }
    
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //var yOffset = ( (self.collectionView.contentOffset.y - self.cell!.frame.origin.y) / (cell!.imageView!.image!.size.height) * cell!.offsetSpeed)
        
        //cell!.initiateParrallaxEffect(CGPointMake(0, yOffset))
        
    }
    
    
    override func contentViewHasAppeared(appeared: Bool) {
        var rightBarButton = GenericBarButtonItem(title: "Dismiss")
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    
    
    // MARK: Use this method to send any information to the NewsArticleView
    // i.e title, image, and the article itself.
    func presentNewsArticleView() {
        var newsArticleView: NewsArticleView = NewsArticleView()
        
        // So we know when the view has appeared
        newsArticleView.delegate = self
        
        // Set the article title
        newsArticleView.setArticleTitle("A Terrible Beauty - Echoes of Easter 1916")
        
        // Set the article image
        newsArticleView.setArticleBackgroundImage("NewsTest7")
        
        
        // Set the new title image
        newsArticleView.setArticleTitleImage("NewsTest7")
        
        // Set the article text
        newsArticleView.setArticleText("LLLLLLLLLLLLLLLLL FERUWIOAHEORUWA H FGUERFHEU H heiuowf eiowhfiowe  hfeh woifewo hfi oehwfhfioehfoehfoewhfoehfoewhfoiewhfioewhfioehfioewhfo")
        newsArticleView.present(self, animated: true)
    }
    
}
