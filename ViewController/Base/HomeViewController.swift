//
//  HomeViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/20.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createViewContollers()
    }
    func createViewContollers() -> Void {
        let titleArray = ["最美","发现","作者","闲置","我"]
        let tabVarImageArray = ["icon-home","back","icon-dpxq-pj","icon-rl-xz","icon-me"]
        let tabVarImageArray1 = ["icon-home-1","backw","icon-dpxq-pj-1","icon-xz-1","icon-me-1"]
        let first = BeautyViewController()
        let second = FindViewController()
        let third = ActorViewController()
        let fourth = SaleViewController()
        let fifth = MineViewController()
        let vcArray = [first,second,third,fourth,fifth]
        // 第一导航页
        first.navigationItem.title = "..."
//        let leftImage = UIImage.init(named: "search")?.imageWithRenderingMode(.AlwaysOriginal)
//        let rightImage = UIImage.init(named: "icon-index-sx")?.imageWithRenderingMode(.AlwaysOriginal)
//        let leftItem = UIBarButtonItem.init(image: leftImage, style: .Done, target: nil, action: nil)
//        let rightItem = UIBarButtonItem.init(image: rightImage, style: .Done, target: nil, action: nil)
//        first.navigationItem.leftBarButtonItem = leftItem
//        first.navigationItem.rightBarButtonItem = rightItem

        // 第二页导航
//        let sLeftImage = UIImage.init(named: "search")?.imageWithRenderingMode(.AlwaysOriginal)
//        let sLeftItem = UIBarButtonItem.init(image: sLeftImage, style: .Done, target: nil, action: nil)
//        second.navigationItem.rightBarButtonItem = sLeftItem
        
        // 第三页导航
//        let aLeftImage = UIImage.init(named: "search")?.imageWithRenderingMode(.AlwaysOriginal)
//        let aLeftItem = UIBarButtonItem.init(image: aLeftImage, style: .Done, target: nil, action: nil)
//        third.navigationItem.rightBarButtonItem = aLeftItem
        
        //第四导航页
//        let tLeftImage = UIImage.init(named: "search")?.imageWithRenderingMode(.AlwaysOriginal)
//        let tLeftItem = UIBarButtonItem.init(image: tLeftImage, style: .Done, target: nil, action: nil)
//        let tRightImage = UIImage.init(named: "drafts")?.imageWithRenderingMode(.AlwaysOriginal)
//        let tRightItem = UIBarButtonItem.init(image: tRightImage, style: .Done, target: nil, action: nil)
//        fourth.navigationItem.leftBarButtonItem = tLeftItem
//        fourth.navigationItem.rightBarButtonItem = tRightItem
      //   fourth.navigationItem.title = "闲置"
        
        //第五导航页
//        let fRightImage = UIImage.init(named: "icon-ddxq-lxkf")?.imageWithRenderingMode(.AlwaysOriginal)
//        let fRightItem = UIBarButtonItem.init(image: fRightImage, style: .Done, target: nil, action: nil)
//        fifth.navigationItem.rightBarButtonItem = fRightItem
        
        var i = 0
        var viewControllers = [UINavigationController]()
        for vc in vcArray {
            let nav = UINavigationController.init(rootViewController: vc)
            nav.title = titleArray[i]
            let image = UIImage.init(named: tabVarImageArray[i])?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            let image1 = UIImage.init(named: tabVarImageArray1[i])?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            let tabItem = UITabBarItem.init(title: titleArray[i], image: image , selectedImage: image1)
            tabItem.imageInsets = UIEdgeInsetsMake(3, 0, -3, 0)
            tabItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12),NSForegroundColorAttributeName:UIColor.black], for: UIControlState())
            tabItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12),NSForegroundColorAttributeName:UIColor.white], for: .selected)
            nav.tabBarItem = tabItem
            tabBar.backgroundImage = UIImage()
            self.tabBar.backgroundColor = UIColor.init(red: 0, green: 255 / 256, blue: 255 / 256, alpha: 0.5)
            viewControllers.append(nav)
            i += 1
            
        }
        self.viewControllers = viewControllers
    }
}
