//
//  ShareViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/12.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.cyan

    }
    func backBtnClick() -> Void {
        self.view.isHidden = true
    }
}
