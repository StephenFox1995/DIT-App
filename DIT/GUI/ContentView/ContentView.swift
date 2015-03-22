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

// @Discussion 
// For any view that wants to receive updates
// on which icon on ContentView was pressed
// they must implement `ContentViewDelegate`
// This will notifiy any view who has added ContentView
// to its subview on the button presses.
class ContentView: UIView {
    
    var delegate: ContentViewDelegate?
    
    // Collection of all icons for this view
    var icons: [ContentIcon] = []
    
    var iconAmount: Int = 5
    

    
    override init() {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height))
        
        // Create all the buttons for this view
        self.createButtons()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    private func createButtons() {
        
        // Create all the icons and add them to the array of icons
        icons.append(ContentIcon(iconType: .Maps, origin: CGPoint(x: 40, y: 90)))
        icons.append(ContentIcon(iconType: .Courses, origin: CGPoint(x: 235, y: 90)))
        icons.append(ContentIcon(iconType: .News, origin: CGPoint(x: 40, y: 250)))
        icons.append(ContentIcon(iconType: .Library, origin: CGPoint(x: 235, y: 250)))
        icons.append(ContentIcon(iconType: .Contact, origin: CGPoint(x: 40, y: 435)))
        icons.append(ContentIcon(iconType: .Timetable, origin: CGPoint(x: 235, y: 435)))
        
        // Add icons to the view
        self.addIconsToView()
        
        // Add actions to all the icon buttons
        addIconActions()
        
    }
    
    
    
    
    private func addIconsToView() {
        for(var i: Int = 0; i < iconAmount; i++) {
            self.addSubview(icons[i])
        }
    }
    
    
    // Add all the actions for the button property on the
    // icons
    private func addIconActions() {
        
        // List of actions for each Icon button to carry out
        var actionList: [Selector] = [
            "displayMapsView",
            "displayCoursesView",
            "displayNewsView",
            "displayLibraryView",
            "displayLibrary" ]
        
        
        for(var i: Int = 0; i < iconAmount; i++) {
            icons[i].action(actionList[i], target: self)
        }
    }
    
    
    
    
    // MARK: Implement protocol methods here to notify the
    // any conforming class which icon was pressed.
    func displayMapsView() {
        self.delegate?.viewControllerToPresent("MapCollectionViewController")
    }
    
    
    // Display Courses
    func displayCoursesView() {
    }
    
    // Display News View
    func displayNewsView() {
        self.delegate?.viewControllerToPresent("NewsArticleViewController")
    }
    
    
    func displayLibrary() {
        
    }
    
    // Display Contacts View
    func displayContactsView() {
    }
    
}