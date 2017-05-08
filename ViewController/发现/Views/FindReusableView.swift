//
//  FindReusableView.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/26.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class FindReusableView: UICollectionReusableView {
        let headerView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        headerView.frame = self.bounds
        self.addSubview(headerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
