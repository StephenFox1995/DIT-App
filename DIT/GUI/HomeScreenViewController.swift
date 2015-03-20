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
        
        
        // To recieve updates on which buttons was pressed
        self.contentView.delegate = self
        
        
        // Add the Content View to receive all the Icons
        self.view.addSubview(contentView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    
    // MARK: Content view delegate implementation
    func viewControllerToPresent(viewController: String) {
        println("BABABA")
    }
    
    
}

