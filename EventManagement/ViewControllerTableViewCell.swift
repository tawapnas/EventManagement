//
//  ViewControllerTableViewCell.swift
//  EventManagement
//
//  Created by สรรพวัศ ซิ่วสุวรรณ on 5/11/2561 BE.
//  Copyright © 2561 สรรพวัศ ซิ่วสุวรรณ. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDateTime: UILabel!
    @IBOutlet weak var eventPlace: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
