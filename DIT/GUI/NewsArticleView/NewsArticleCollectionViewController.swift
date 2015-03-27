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
    
    
    var newsArticleView: NewsArticleView = NewsArticleView()
    
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
    
    
    
    // MARK: ContentViewDelegate
    func contentViewHasAppeared(appeared: Bool) {
        
        var rightBarButton = GenericBarButtonItem(imageName: "NewsTest3")
        rightBarButton.addAction(Selector("dismissContentView"), target: self)
        
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    
    func dismissContentView() {
        self.newsArticleView.dismiss({finished in
            self.navigationItem.rightBarButtonItem = nil})
    }
    
    
    
    
    
    // MARK: Use this method to send any information to the NewsArticleView
    // i.e title, image, and the article itself.
    func presentNewsArticleView() {
        
        
        // So we know when the view has appeared
        newsArticleView.delegate = self
        
        // Set the article image
        newsArticleView.setArticleBackgroundImage("NewsTest2")
        
        
        // Set the article title
        newsArticleView.setArticleTitle("Sport Report: DIT Claims colleges FAI UMBRO B Cup")
        
        
        // Set the new title image
        newsArticleView.setArticleTitleImage("NewsTest2")
        
        // Set the article text
        newsArticleView.addTextForArticle("Gavin Fleming’s squad had a tough route to the final, with an open draw for all rounds.  The team faced all away ties which saw them beat Colaiste Ide, IT Blanchardstown, Limerick IT (Tipperary) and Athlone IT on their way to the final where they faced the much fancied IT Carlow. Carlow looked the more impressive side early on and took the lead on 20 minutes but failed to press home their advantage.  They paid the price close to half time when Michael Christian leveled for DIT with a smart finish after Carlow keeper Killian Fitzpatrick saved Darragh Maguire’s initial effort.")
        
        newsArticleView.addImageToArticle("b")

        newsArticleView.addTextForArticle("Substitute Mayo Akinola had a couple of late chances in normal time to clinch the win for DIT but he never really tested the keeper. The game was finally settled midway through the second period of extra time when Adam Zayed coolly slotted the ball past the Carlow keeper after good work by Patrick Kavanagh and Jason Coleman. It was a much deserved win for the DIT lads who also had a very strong league campaign and just missed out on progression to the knock out stages on goal difference.  This was just the second time DIT has claimed this title, the first back in 2008. According to DIT’s Soccer Development Officer, John O Carroll, this is also the first piece of silverware for the soccer club since the historic Premier League win in 2013. I would like to congratulate the team on a fantastic achievement and also for the great work done throughout the year by manager Gavin Fleming and his assistant Gary Doyle.")
        
        newsArticleView.present(self, animated: true)
    }
    
}
