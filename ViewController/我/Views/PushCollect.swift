//
//  PushCollect.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/27.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit
// 我的收藏
class PushCollect: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false
        self.createViews()
    }
    func createViews() -> Void {
        let bianJi = UIBarButtonItem.init(title: "编辑", style: UIBarButtonItemStyle.done, target: nil, action: nil)
        bianJi.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.gray], for: UIControlState())
        self.navigationItem.rightBarButtonItem = bianJi
        //
        let backBtnImage = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        let backItem = UIBarButtonItem.init(image: backBtnImage, style: .done, target: self, action:#selector(self.backBtnClick))
        self.navigationItem.leftBarButtonItem = backItem
        self.navigationController?.navigationItem.title = "我的收藏"
    }
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
}
