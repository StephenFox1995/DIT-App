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
    
    

    var courseInformationFont = Font()
    var courseNameFont = Font()
    var courseCodefont = Font()
    var scrollView: GenericScrollView!
    
//    var courseCode: HeaderInformationLabel!
//    var courseName: HeaderInformationLabel!
//    var courseDepartment: CourseInformationLabel!
//    var courseLocation: CourseInformationLabel!
//    var courseCapacity: CourseInformationLabel!
//    var courseEmail: CourseInformationLabel!
//    var courseDescription: GenericTextView!

    
    override init() {
        super.init()
        
        self.courseCodefont.getFont(.AvenirNext, fontStyle: .Regular, size: 30)
        self.courseNameFont.getFont(.AvenirNext, fontStyle: .Light, size: 20)
        self.courseInformationFont.getFont(.AvenirNext, fontStyle: .Regular, size: 20)
        scrollView = GenericScrollView(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.heightWithNavigationBar))
        
        self.addSubview(scrollView)
        
    }

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: Methods for setting content of view
    
    func setCode(code: String) {
        self.scrollView.addText(code, font: courseCodefont)
    }
    
    func setName(name: String) {
        self.scrollView.addText(name, font: courseNameFont)
    }
    
    
    func setDepartment(department: String) {
        self.scrollView.addText(department, font: courseInformationFont)
    }
    
    func setLocation(location: String) {
        self.scrollView.addText(location, font: courseInformationFont)
    }
    
    func setCapacity(capacity: String) {
        self.scrollView.addText(capacity, font: courseInformationFont)
    }
    
    
    func setEmail(email: String) {
        self.scrollView.addText(email, font: courseInformationFont)
    }
    
    
    func setDescription(description: String) {
        self.scrollView.addText(description, font: courseInformationFont)
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
            animations: { self.scrollView.alpha = 1.0},
            completion: nil)
    }
    
}







