//
//  CourseViewController.swift
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

class CourseViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource {
    
    var reuseIdentifier: String = "cell"
    var tableView: GenericTableView!
    var courseNames: [String] = ["Computer Science", "Business", "Ketamine"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "COURSES"
        
        // Set up the tableView
        tableView = GenericTableView(frame: CGRectMake(0, 0, Screen.width, Screen.height), style: .Plain)
        tableView.registerClass(CourseTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(tableView)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        // Un-hide navigation bar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as CourseTableViewCell
        cell.setCell("Computer Science")
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var contentView: GenericContentView = GenericContentView()
        contentView.present(self, animated: true)
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CourseTableViewCell.height
    }

}
