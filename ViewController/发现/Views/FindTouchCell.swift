//
//  FindTouchCell.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/11.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class FindTouchCell: UITableViewCell {
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var releaseTimeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
