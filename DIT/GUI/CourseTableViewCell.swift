//
//  CourseTableViewCell.swift
//  DIT
//
//  Created by Stephen Fox on 24/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit


class CourseTableViewCell: UITableViewCell {
    
    class var height: CGFloat { get {return 40.0} }
    
    var cellfont: Font = Font()
    
    // Setup cell here
    override func layoutSubviews() {
        self.backgroundColor = UIColor.clearColor()
        self.textLabel?.textColor = UIColor.whiteColor()
        self.textLabel?.font = cellfont.getFont(.AvenirNext, fontStyle: .Light, size: 20)
    }
    
    
    func setCell(title: String) {
        self.textLabel?.text = title
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
