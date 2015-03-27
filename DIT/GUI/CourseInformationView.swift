//
//  CourseInformationView.swift
//  DIT
//
//  Created by Stephen Fox on 24/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// Course Name
// Course Code
// Course Description
// Course Department - e.g School of Computing
// Email for course
// Location
// Number of places
// Qualtication
// Link to dit
class CourseInformationView: GenericContentView, GenericContentViewDelegate {
    
    
    var _font: Font = Font()
    
    var courseCode: HeaderInformationLabel!
    var courseName: HeaderInformationLabel!
    var courseDepartment: CourseInformationLabel!
    var courseLocation: CourseInformationLabel!
    var courseCapacity: CourseInformationLabel!
    var courseEmail: CourseInformationLabel!
    var courseDescription: GenericTextView!
    
    // Hold arrays of the label objects so
    // we can set common attributes to them.
    var headerInformation: [HeaderInformationLabel]  = []
    var courseInformation: [CourseInformationLabel] = []
    
    override init() {
        super.init()
        
        self.delegate = self
        
        // Set up content for this view
        // Header Information
        self.courseCode = HeaderInformationLabel(frame: CGRect(x: 0, y: 20, width: Screen.width, height: 25))
        self.courseCode.font = _font.getFont(.AvenirNext, fontStyle: .Regular, size: 30)
        self.courseName = HeaderInformationLabel(frame: CGRect(x: 0, y: 50, width: Screen.width, height: 25))
        

        // Add to array so we can add to subview
        self.headerInformation.append(self.courseCode)
        self.headerInformation.append(self.courseName)
        
        
        // Add to subview and animate
        for label in headerInformation {
            self.addSubview(label)
            self.animateIntoView(label, duration: 0.8, delay: 0.0)
        }
        
        
        // Course information labels
        self.courseDepartment = CourseInformationLabel(frame: CGRect(x: 10, y: 90, width: Screen.width, height: 20))
        self.courseLocation = CourseInformationLabel(frame: CGRect(x: 10, y: 110, width: Screen.width, height: 20))
        self.courseCapacity = CourseInformationLabel(frame: CGRect(x: 10, y: 130 , width: Screen.width, height: 20))
        self.courseEmail = CourseInformationLabel(frame: CGRect(x: 10, y: 150, width: Screen.width, height: 20))
        
        
        
        // Add to array so we can add to subview
        self.courseInformation.append(self.courseDepartment)
        self.courseInformation.append(self.courseLocation)
        self.courseInformation.append(self.courseCapacity)
        self.courseInformation.append(self.courseEmail)
        
        
        // Add to subviews
        for label in courseInformation {
            self.addSubview(label)
            self.animateIntoView(label, duration: 1.0, delay: 0.2)
        }
        
        
        
        // Add course description to view
        self.courseDescription = GenericTextView(frame: CGRect(x: 0, y: 200, width: Screen.width, height: Screen.halfHeight))
        self.courseDescription.font = font.getFont(.AvenirNext, fontStyle: .Light, size: 20)
        self.addSubview(courseDescription)
        
        self.animateIntoView(courseDescription, duration: 1.0, delay: 0.2)
        
    }

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func contentViewHasAppeared(appeared: Bool) {
        
    }
    
    
    // MARK: Methods for setting content of view
    
    func setCode(code: String) {
        self.courseCode.text = code
    }
    
    func setName(name: String) {
        self.courseName.text = name
    }
    
    
    func setDepartment(department: String) {
        self.courseDepartment.text = department
    }
    
    func setLocation(location: String) {
        self.courseLocation.text = location
    }
    
    func setCapacity(capacity: String) {
        self.courseCapacity.text = capacity
    }
    
    
    func setEmail(email: String) {
        self.courseEmail.text = email
    }
    
    
    func setDescription(description: String) {
        self.courseDescription.text = description
    }
    
    
    
    // Animates a label into the view hierarchy
    // @param label : Label to animate
    // @param duration: Specify how long the animation should execute for
    // @param delay: How long to wait before the animation begins
    func animateIntoView(view: UIView, duration: NSTimeInterval, delay: NSTimeInterval) {
        view.alpha = 0
        
        
        UIView.animateWithDuration(duration,
            delay: delay,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { view.alpha = 1.0},
            completion: nil)
    }
    
}





// Class for header information
class HeaderInformationLabel: UILabel {
    
    var labelfont: Font = Font()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.textAlignment = .Center
        self.textColor = UIColor.whiteColor()
        self.font = labelfont.getFont(.AvenirNext, fontStyle: .Light, size: 20)
        self.backgroundColor = UIColor.clearColor()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}








// Class for course information
class CourseInformationLabel: UILabel {
    
    var labelFont: Font = Font()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.textColor = UIColor.whiteColor()
        self.font = labelFont.getFont(.AvenirNext, fontStyle: .Regular, size: 18)
        self.backgroundColor = UIColor.clearColor()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


