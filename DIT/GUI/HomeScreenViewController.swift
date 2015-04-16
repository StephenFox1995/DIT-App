//
//  ViewController.swift
//  DIT
//
//  Created by Stephen Fox on 13/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// Global variable any object can use to accomodate for the navigation
// bar being in view
var navigationBarHeight: CGFloat {get {return 64}}

class HomeScreenViewController: GenericViewController, ContentViewDelegate{
    
    
    var contentView: ContentView = ContentView()
    var headerLabel: UILabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // So nothing is displayed under the navgation bar
        self.navigationController?.navigationBar.translucent = false
        
        // To recieve updates on which buttons was pressed on the content view
        self.contentView.delegate = self
        
        // Set up the header label
        self.headerLabel = UILabel(frame: CGRectMake(0, 20, Screen.width, 40))
        self.headerLabel.center.x = self.view.center.x
        self.headerLabel.textColor = UIColor.whiteColor()
        self.headerLabel.font = font.getFont(.AvenirNext, fontStyle: .Light, size: 30)
        self.headerLabel.textAlignment = NSTextAlignment.Center
        self.headerLabel.text = "Kevin Street"
        
        
        // Add the ContentView for all icons
        self.view.addSubview(contentView)
        
        self.view.addSubview(headerLabel)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        // Hide navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    

    
    
    // MARK: ContentView delegate implementation
    // Notifies us when user presses button on ContentView
    func viewControllerToPresent(viewController: String) {
        
        // Decide which view Controller to display
        
        switch(viewController) {
            
        case "MapCollectionViewController":
            var mapCollectionViewController = MapCollectionViewController()
            self.navigationController?.pushViewController(mapCollectionViewController, animated: true)
            break
            
        case "NewsArticleViewController":
            var newsArticleViewController = NewsArticleCollectionViewController()
            self.navigationController?.pushViewController(newsArticleViewController, animated: true)
            break
            
        case "CourseViewController":
            var courseViewController = CourseViewController()
            self.navigationController?.pushViewController(courseViewController, animated: true)
            break
            
        default:
            break
            
        }
        
    }
}

