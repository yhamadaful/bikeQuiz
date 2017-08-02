//
//  AnswerTableViewCell.swift
//  20170725
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {

    @IBOutlet var answerLabel : UILabel!
    @IBOutlet var numberImage : UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
