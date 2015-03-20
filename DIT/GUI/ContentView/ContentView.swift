//
//  ContentView.swift
//  DIT
//
//  Created by Stephen Fox on 15/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit


// Any object that uses this protocol will be informed
// which button has been pressed. 
protocol ContentViewDelegate {
    
    // @param viewController - String corresponding to the View Controller to present.
    func viewControllerToPresent(viewController: String)
}



// ContentView contains all the home screens icons
class ContentView: UIView {
    
    var delegate: ContentViewDelegate?
    
    // Collection of all icons for this view
    var icons: [ContentViewIcon] = []
    
    var iconAmount: Int = 6
    

    
    override init() {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height))
        
        self.createButtons()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    private func createButtons() {
        
        // Create all the buttons and add them to the array of icons
        icons.append(ContentViewIcon(iconType: .Maps, origin: CGPoint(x: 40, y: 90)))
        icons.append(ContentViewIcon(iconType: .Courses, origin: CGPoint(x: 235, y: 90)))
        icons.append(ContentViewIcon(iconType: .News, origin: CGPoint(x: 40, y: 250)))
        icons.append(ContentViewIcon(iconType: .Library, origin: CGPoint(x: 235, y: 250)))
        icons.append(ContentViewIcon(iconType: .Contact, origin: CGPoint(x: 40, y: 435)))
        icons.append(ContentViewIcon(iconType: .Timetable, origin: CGPoint(x: 235, y: 435)))
        
        // Add buttons to the view
        self.addButtonsToView()
    }
    
    
    
    
    private func addButtonsToView() {
        for(var i: Int = 0; i < iconAmount; i++) {
            self.addSubview(icons[i])
        }
    }
    
    
    
    
    // MARK: Implement protocol methods here to notify the
    // any conforming class which View Controller to present
    @IBAction func displayMapsView(sender: AnyObject) {
        println("Maps")
    }
    
    
    // Display Courses
    @IBAction func displayCoursesView(sender: AnyObject) {
    }
    
    // Display News View
    @IBAction func displayNewsView(sender: AnyObject) {
    }
    
    
    // Display Contacts View
    @IBAction func displayContactsView(sender: AnyObject) {
    }
}