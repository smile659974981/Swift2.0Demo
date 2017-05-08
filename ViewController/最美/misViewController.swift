//
//  misViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/22.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class misViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.tabBarController?.tabBar.isHidden = true
        self.createViews()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    func createViews() -> Void {
        let imageView = UIImageView.init(frame: self.view.bounds)
        let image = UIImage.init(named: "IMG_2695.JPG")
        imageView.image = image
        self.view.addSubview(imageView)
        let backBtnImage = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        let backItem = UIBarButtonItem.init(image: backBtnImage, style: .done, target: self, action:#selector(self.backBtnClick))
        self.navigationItem.leftBarButtonItem = backItem
    }
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
}
