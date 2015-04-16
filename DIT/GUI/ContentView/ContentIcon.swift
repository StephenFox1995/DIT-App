//
//  ContentViewButtonIcon.swift
//  DIT
//
//  Created by Stephen Fox on 20/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// As the Icons for the app
// will generally remain the same
// use a enum to refererence what the button will do.
enum ContentIconType {
    case Maps
    case Courses
    case News
    case Library
    case Contacts
    case Timetables
}



// 
// @Discussion: 
// This class allows ContentView to add icons i.e.
// An object that has a UIButton & UILabel
//
class ContentIcon: UIView {
    
    var iconButton: UIButton = UIButton()
    var iconTitle: UILabel = UILabel()
    
    private var iconType: ContentIconType?
    
    var height: CGFloat?
    var width: CGFloat?
    
    var font: Font = Font()
    
    
    
    // @param iconType: Type of icon to be displayed
    // @param point: Coordinates of the ContentViewIcon
    init(iconType: ContentIconType, origin: CGPoint) {
        
        super.init(frame: CGRect(
            x: origin.x,
            y: origin.y,
            width: 90,
            height: 90))
        
        self.width = self.frame.size.width
        self.height = self.frame.size.height
        
        
        self.iconType = iconType
        
        // Setup the button
        self.setupIcon(iconType)
    }
    
    
    // Setups up an button(image) and a title for an icon
    // @param iconType - The type of icon to be set up
    private func setupIcon(iconType:ContentIconType) {
        
        // Setup position of button frame
        self.iconButton.frame = CGRect(
            x: 0,
            y: 0,
            width: 90,
            height: 90)
        
        
        
        // Setup positon of title frame
        self.iconTitle.frame = CGRect(
            x: 0,
            y: 80,
            width: 90,
            height: 20)
        
        // Set titles attributes
        self.iconTitle.textColor = UIColor.whiteColor()
        self.iconTitle.font = font.getFont(.AvenirNext, fontStyle: .Regular, size: 20)
        self.iconTitle.textAlignment = .Center
        
        switch(self.iconType!) {
            
        case .Maps:
            self.iconButton.setImage(UIImage(named: "Maps"), forState: .Normal)
            self.iconTitle.text = "Maps"
            break
            
        case .Courses:
            self.iconButton.setImage(UIImage(named: "Courses"), forState: .Normal)
            self.iconTitle.text = "Courses"
            break
            
        case .News:
            self.iconButton.setImage(UIImage(named: "News"), forState: .Normal)
            self.iconTitle.text = "News"
            break
            
        case .Library:
            self.iconButton.setImage(UIImage(named: "Library"), forState: .Normal)
            self.iconTitle.text = "Library"
            break
            
        case .Contacts:
            self.iconButton.setImage(UIImage(named: "Contacts"), forState: .Normal)
            self.iconTitle.text = "Contacts"
            break
            
            
        case .Timetables:
            self.iconButton.setImage(UIImage(named: "Timetables"), forState: .Normal)
            self.iconTitle.text = "Timetables"
            
            
        default:
            break;
            
        }
        
        // Add to button and image to icon view
        self.addSubview(iconButton)
        self.addSubview(iconTitle)
    }
    
    
    
    // Add action for the button when clicked.
    // @param action - Method to be called
    // @param target - The object to where the methos will be called
    func action(action: Selector, target: AnyObject?) {
        self.iconButton.addTarget(target, action: action, forControlEvents: .TouchUpInside)
    }
    
    
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
