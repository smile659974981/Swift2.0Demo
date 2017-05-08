//
//  ActorCell.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/26.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class ActorCell: UITableViewCell {
    @IBOutlet weak var subTitlelabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.iconView.layer.cornerRadius = iconView.frame.size.width / 2
        iconView.clipsToBounds = true
        descriptionLabel.textColor = UIColor.gray
        descriptionLabel.font = UIFont.systemFont(ofSize: 11)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
