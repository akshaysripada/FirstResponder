//
//  ViewControllerTableViewCell.swift
//  FirstResponder
//
//  Created by Akshay Sripada on 4/6/18.
//  Copyright © 2018 Akshay Tracy Co. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var labelMatch: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
