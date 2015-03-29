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
class NewsArticleView: GenericContentView, UIScrollViewDelegate {
    
    var articleTextView: GenericTextView!
    var title: UILabel!
    var articleTitleImage: UIImageView!
    var scrollView: GenericScrollView!

    
    override init() {
        super.init()
        
        
        scrollView = GenericScrollView(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.heightWithNavigationBar))
        self.scrollView.delegate = self
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
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: Set up content for view
    
    // Adds text to the scroll view property of this view.
    // Uses font: Avenir Next, style: Regular, size: 20
    // @param article - Text to be added for the article
    func addTextForArticle(article: String) {
        var articleFont = Font()
        articleFont.getFont(.AvenirNext, fontStyle: .Regular, size: 20)
        
        self.scrollView.addText(article, font: articleFont, textAlignment: .Left, spacing: 30)
    }
    
    
    
    // Adds text for a title to the scroll view property of this view.
    // Uses font: Avenir Next, style: Bold, size: 20
    // @param title
    func setArticleTitle(title: String) {
        var titleFont = Font()
        titleFont.getFont(.AvenirNext, fontStyle: .Bold, size: 20)
        
        self.scrollView.addText(title, font: titleFont, textAlignment: .Left, spacing: 40)
    }
    
    
    func addImageToArticle(imagename: String) {
        var url = NSURL(string: "http://www.dit.ie/media/newsimages/2015/homepageDITFashionShow2015.jpg")
        self.scrollView.addImageWithURL(url!)
    }
    
    
    
    
    func setArticleTitleImage(name: String) {
        var url = NSURL(string: "http://www.dit.ie/media/newsimages/2015/homepageDITFashionShow2015.jpg")
        self.scrollView.addImageWithURL(url!)
    }
    
    
    
    // Sets the background image for the article story
    // @param name - Name of the image to set
    func setArticleBackgroundImage(name: String) {
        var url = NSURL(string: "http://www.dit.ie/media/newsimages/2015/homepageDITFashionShow2015.jpg")
        super.setBackgroundImageWithURl(url!)
    }
    
    
    
    // MARK: Present NewsArticleView
    
    
    // Present this view
    // @param onView - View which his responsible to presenting
    // @prama animated - Animate presentation
    override func present(target: AnyObject, animated: Bool) {
        super.present(target, animated: animated)
    }
}
