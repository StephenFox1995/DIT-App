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
class CourseInformationView: GenericContentView {
    
    
    var font_: Font = Font()
    
    var courseCode: HeaderInformationLabel!
    var courseName: HeaderInformationLabel!
    var courseDepartment: CourseInformationLabel!
    var courseLocation: CourseInformationLabel!
    var courseCapacity: CourseInformationLabel!
    var courseEmail: CourseInformationLabel!
    var courseDescription: UITextView!
    
    // Hold arrays of the label objects so
    // we can set common attributes to them.
    var headerInformation: [HeaderInformationLabel]  = []
    var courseInformation: [CourseInformationLabel] = []
    
    override init() {
        super.init()
        
        // Set up content for this view
        // Header Information
        self.courseCode = HeaderInformationLabel(frame: CGRect(x: 0, y: 20, width: Screen.width, height: 25))
        self.courseCode.font = font_.getFont(.AvenirNext, fontStyle: .Regular, size: 30)
        self.courseName = HeaderInformationLabel(frame: CGRect(x: 0, y: 50, width: Screen.width, height: 25))
        
        self.courseCode.text = "DT228"
        self.courseName.text = "COMPUTER SCIENCE"

        // Add to array so we can add to subview
        self.headerInformation.append(self.courseCode)
        self.headerInformation.append(self.courseName)
        
        
        // Add to subview
        for label in headerInformation {
            self.addSubview(label)
        }
        
        
        // Course information
        self.courseDepartment = CourseInformationLabel(frame: CGRect(x: 0, y: 90, width: Screen.width, height: 30))
        self.courseLocation = CourseInformationLabel(frame: CGRect(x: 0, y: 120, width: Screen.width, height: 30))
        self.courseCapacity = CourseInformationLabel(frame: CGRect(x: 0, y: 150 , width: Screen.width, height: 30))
        self.courseEmail = CourseInformationLabel(frame: CGRect(x: 0, y: 180, width: Screen.width, height: 30))
        
        
        self.courseDepartment.text = "School of Computing"
        
        // Add to array so we cann add to subview
        self.courseInformation.append(self.courseDepartment)
        self.courseInformation.append(self.courseLocation)
        self.courseInformation.append(self.courseCapacity)
        self.courseInformation.append(self.courseEmail)
        
        
        // Add to subviews
        for label in courseInforamtion {
            self.addSubview(label)
        }
        

        
    }

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class HeaderInformationLabel: CourseInformationLabel {
    
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



class CourseInformationLabel: CourseInformationLabel {
    
    var labelFont: Font = Font()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.textColor = UIColor.whiteColor()
        self.font = labelFont.getFont(.AvenirNext, fontStyle: .Regular, size: 25)
        self.backgroundColor = UIColor.clearColor()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


