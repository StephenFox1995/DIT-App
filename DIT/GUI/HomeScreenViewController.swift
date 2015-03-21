//
//  ViewController.swift
//  DIT
//
//  Created by Stephen Fox on 13/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

class HomeScreenViewController: GenericViewController, ContentViewDelegate{
    
    
    var contentView: ContentView = ContentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // So nothing is displayed under the navgation bar
        self.navigationController?.navigationBar.translucent = false
        
        // To recieve updates on which buttons was pressed on the content view
        self.contentView.delegate = self
        
        
        // Add the ContentView for all icons
        self.view.addSubview(contentView)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        // Hide navigation bar
        self.navigationController?.navigationBarHidden = true
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
            var mapView = MapCollectionViewController()
            self.navigationController?.pushViewController(mapView, animated: true)
            break
            
        default:
            break
            
        }
        
    }
    
    
}

