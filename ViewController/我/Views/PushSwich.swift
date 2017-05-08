//
//  PushSwich.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/27.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class PushSwich: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = UIColor.white
        self.createViews()
    }
    func createViews() -> Void {
        let backBtnImage = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        let backItem = UIBarButtonItem.init(image: backBtnImage, style: .done, target: self, action:#selector(self.backBtnClick))
        self.navigationItem.leftBarButtonItem = backItem
        self.navigationController?.navigationItem.title = "功能开关"
    }
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
}
