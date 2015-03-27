//
//  NewsArticleView.swift
//  DIT
//
//  Created by Stephen Fox on 21/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// This class presents a NewsArticleView, which will display
// - News Title
// - News Article
// - News Image (Used as the background for the story)
class NewsArticleView: GenericContentView, GenericContentViewDelegate {
    
    var articleTextView: GenericTextView!
    var title: UILabel!
    var articleTitleImage: UIImageView!
    var scrollView: GenericScrollView!
    
    override init() {
        super.init()
        
        
        scrollView = GenericScrollView(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.heightWithNavigationBar))
        self.addSubview(scrollView)
        
        // Set up the textview for the article
        articleTextView = GenericTextView(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.heightWithNavigationBar))
        
        // Set up the title for the article
        title = UILabel(frame: CGRect(x: 0, y: 0, width: Screen.width, height: 70))
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
        title.textColor = UIColor.whiteColor()
        title.font = font.getFont(.AvenirNext, fontStyle: .Bold, size: 30)
        
        //self.addSubview(articleTextView)
        //self.articleTextView.addSubview(title)
    }
    
    
    func contentViewHasAppeared(appeared: Bool) {
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //MARK: Set up content for view
    
    // Sets the textviews text
    // @param article
    func setArticleText(article: String) {
        var tempArticle: String = article
        //self.articleTextView?.addText(tempArticle)
        
        self.scrollView.addText(article, fontSize: 25)
        

    }
    
    
    
    // Sets the title for the view
    // @param title
    func setArticleTitle(title: String) {
        //self.title.text = title
    }
    
    
    func setArticleTitleImage(name: String) {
        self.articleTitleImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 321, height: 181))
        self.articleTitleImage.image = UIImage(named: name)
        
        //self.articleTextView.addSubview(articleTitleImage)
        
    }
    
    
    
    // Sets the background image for the article story
    // @param name - Name of the image to set
    func setArticleBackgroundImage(name: String) {
        super.setBackgroundImage(name)
    }
    
    
    
    // MARK: Present NewsArticleView
    
    
    // Present this view
    // @param onView - View which his responsible to presenting
    // @prama animated - Animate presentation
    override func present(target: AnyObject, animated: Bool) {
        super.present(target, animated: animated)
    }
}
