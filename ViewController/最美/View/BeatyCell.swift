//
//  BeatyCell.swift
//  HotCar
//
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class BeatyCell: UITableViewCell {
    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var headView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.headView.layer.cornerRadius = self.headView.frame.size.height / 2
        self.headView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
