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
class NewsArticleView: GenericContentView {
    
    var articleTextView: GenericTextView!
    var title: ExpandableLabel!
    
    override init() {
        super.init()
        
        self.delegate = self
        
        // Set up the textview for the article
        articleTextView = GenericTextView(frame: CGRect(x: 0, y: 70, width: Screen.width, height: Screen.height))
        
        // Set up the title for the article
        title = ExpandableLabel(frame: CGRect(x: 0, y: 0, width: Screen.width, height: 70), amountToExpand: 20)
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
        title.textColor = UIColor.whiteColor()
        title.font = font.getFont(.AvenirNext, fontStyle: .Bold, size: 30)
        
        // Add the title and article to view
        self.addSubview(title)
        self.addSubview(articleTextView)
    }

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // When this view has appeared, it is responsible 
    // for displaying the appropriate button in
    // the navigation bar to dissmiss the view
    // when the user has finished.
    override func contentViewHasAppeared(appeared: Bool) {
        super.contentViewHasAppeared(true)
    }
    
    
    //MARK: Set up content for view
    
    // Sets the textviews text
    // @param article
    func setArticleText(article: String) {
        self.articleTextView?.text(article)
    }
    
    
    
    // Sets the title for the view
    // @param title
    func setArticleTitle(title: String) {
        self.title?.text = title
    }
    
    
    
    // Sets the background image for the article story
    // @param name - Name of the image to set
    func setArticleImage(name: String) {
        super.setImage(name)
    }
    
    
    
    // MARK: Present NewsArticleView
    
    
    // Present this view
    // @param onView - View which his responsible to presenting
    // @prama animated - Animate presentation
    override func present(target: AnyObject, animated: Bool) {
        super.present(target, animated: animated)
    }
}
