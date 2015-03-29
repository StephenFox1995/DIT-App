//
//  CourseViewController.swift
//  DIT
//
//  Created by Stephen Fox on 24/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit


class CourseViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource {
    
    var reuseIdentifier: String = "cell"
    var tableView: GenericTableView!
    var courseNames: [String] = ["Computer Science", "Business", "Biology", "Science", "Food Science"]
    
    var cellFont: Font = Font()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "COURSES"
        
        // Set up the tableView
        tableView = GenericTableView(frame: CGRectMake(0, 0, Screen.width, Screen.heightWithNavigationBar), style: .Plain)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
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
    
    
    
    // MARK: Tableview methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseNames.count
    }
    
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = cellFont.getFont(.AvenirNext, fontStyle: .Regular, size: 20)
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        
        // Set course name for the cell
        cell.textLabel?.text = courseNames[indexPath.row]
        
        return cell
    }
    
    
    
    
    
    // MARK: Pass course information to CourseInformationView
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var courseInformationView: CourseInformationView = CourseInformationView()
        
        // Pass info about course
        courseInformationView.setCode("DT228")
        courseInformationView.setName("COMPUTER SCIENCE")
        courseInformationView.setDepartment("School of Computing")
        courseInformationView.setLocation("Kevin Street")
        courseInformationView.setCapacity("Capacity: 100")
        courseInformationView.setEmail("computerscience@dit.ie")
        courseInformationView.setDescription("Did you ever wonder how emails get sent, how Google works, how to develop your own computer game? Are you interested in understanding what goes on behind the scenes at Amazon or eBay? Do you want to know what an MP3 file actually is or how podcasting and ITunes work? Then this programme is for you. As well as answering these questions, this programme will prepare you to work as a software application developer in a variety of commercial and industrial environments. It will equip you with the understanding and skills needed in an exciting and constantly changing industry.")
        
        courseInformationView.present(self, animated: true)
    }
    
    
    // Set Colours on selection and deselection of cell
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath)
        cell!.backgroundColor = UIColor(red: 0.152, green: 0.447, blue: 0.733, alpha: 0.8)
    }
    
    
    func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath)
        cell!.backgroundColor = UIColor.clearColor()
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
}
