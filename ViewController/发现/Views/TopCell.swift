//
//  TopCell.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/17.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class TopCell: UITableViewCell {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var releaseTimeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
