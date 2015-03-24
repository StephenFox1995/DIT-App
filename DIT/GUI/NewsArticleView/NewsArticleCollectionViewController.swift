//
//  NewsArticleCollectionViewController.swift
//  DIT
//
//  Created by Stephen Fox on 22/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// Class which shows a collection of news stories.
class NewsArticleCollectionViewController: GenericViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var cell: GenericCollectionViewCell?
    private var identifier = "cell"
    private var collectionView: GenericCollectionView = GenericCollectionView()

    
    private var images: [String] = ["NewsTest", "NewsTest2", "NewsTest3", "NewsTest4"]
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
    
    
    
    
    // MARK: Use this method to send any information to the NewsArticleView
    // i.e title, image, and the article itself.
    func presentNewsArticleView() {
        var newsArticleView: NewsArticleView = NewsArticleView()
        
        // Set the article title
        newsArticleView.setArticleTitle("A Terrible Beauty - Echoes of Easter 1916")
        
        // Set the article image
        newsArticleView.setArticleImage("NewsTest4")
        
        // Set the article text
        newsArticleView.setArticleText("Lorem Ipsum random shite, fhidhfc iejie ieie cduie icjeic cnjodhf eofhieo heowrf hofhewo fewohohfgowhfohowfohf  hfoehfow fowh ohf ow f hofh ohfohfohfo hohfowf hofhowhf oh ofh owow hfow ow ofhow  hwo hfow hfowh o hwo fow hfowhfow wohfwohfeowhfuoewhfo wh howh eow fiewofhieow hfiewo hefiwoh hfruo oreghrugrfrur uffu freuohfwrhf uiwrffvurhf ruhfu  uf heru r hfu grhie hfroe;o wf owrh iofw hjvrwj foewn wh of3 wre vvbjksnvosheho ew fvhrwui hwi fea firwg fw wk frw hfwe w hfw heow heow hw wh fuewh fuewh fuwerio hfuwo fu ewif uiewh fiewhfiehfiewb fuiewh fiew hfuiewh fuiewh fuiewh ufiweh few buvweb iwbriewbvirehvorwafuberwio;afhruewo; HRUWQfeoruwqa;fehuwqFERUW FERUWIOAHEORUWA H FGUERFHEU H")
        newsArticleView.present(self, animated: true)
    }
    
}
