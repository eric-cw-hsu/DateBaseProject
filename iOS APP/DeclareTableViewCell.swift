//
//  SongsTableViewCell.swift
//  Music Plus
//
//  Created by 劉品萱 on 2019/9/21.
//  Copyright © 2019 劉品萱. All rights reserved.
//

import UIKit

class SongsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var CoverCell: UIImageView!
    @IBOutlet weak var SongNameCell: UILabel!
    @IBOutlet weak var SingerCell: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class MyPageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var MyPageFuncIconCell: UIImageView!
    
    @IBOutlet weak var MyPageFuncLabelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
