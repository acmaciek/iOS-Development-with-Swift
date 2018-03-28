//
//  TableViewCell.swift
//  EDT
//
//  Created by Maciek Girek on 3/27/18.
//  Copyright © 2018 Maciek Girek. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    // @IBOutlet weak var infoLabel: UILabel!
   // @IBOutlet weak var cellView: UIView!
   // @IBOutlet weak var iconImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
