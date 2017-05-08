//
//  FindSecondCell.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/19.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class FindSecondCell: UICollectionViewCell {
    @IBOutlet weak var blurredImage: UIImageView!
    @IBOutlet weak var detialView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var releaseTimeLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var aView: UIView!
    @IBOutlet weak var bView: UIView!
    @IBOutlet weak var backBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        DescriptionLabel.textAlignment = .center
    }
}
