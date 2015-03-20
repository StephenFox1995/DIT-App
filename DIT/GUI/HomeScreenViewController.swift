//
//  ViewController.swift
//  DIT
//
//  Created by Stephen Fox on 13/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

class HomeScreenViewController: GenericViewController{
    
    

    var contentView: ContentView = ContentView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(contentView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
}

