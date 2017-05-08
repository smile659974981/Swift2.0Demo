//
//  PushWrite.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/27.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class PushWrite: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = UIColor.white
        self.createViews()
    }
    func createViews() -> Void {
        //    
        let touGao = UIBarButtonItem.init(title: " 投稿", style: UIBarButtonItemStyle.done, target: nil, action: nil)
        touGao.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.gray], for: UIControlState())
        self.navigationItem.rightBarButtonItem = touGao
        //
        let backBtnImage = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        let backItem = UIBarButtonItem.init(image: backBtnImage, style: .done, target: self, action:#selector(self.backBtnClick))
        self.navigationItem.leftBarButtonItem = backItem
        self.navigationController?.navigationItem.title = "我要投稿"
        //
        let aTextFile = UITextField.init(frame: CGRect(x: 10, y: 90, width: SCREEN_W - 20, height: 40))
        aTextFile.placeholder = "昵称"
        aTextFile.borderStyle = .line
        aTextFile.textAlignment = .center
        aTextFile.font = UIFont.systemFont(ofSize: 13)
        self.view.addSubview(aTextFile)
        let bTextFile = UITextField.init(frame: CGRect(x: 10, y: aTextFile.mj_y + aTextFile.mj_h + 30, width: SCREEN_W - 20, height: 40))
        bTextFile.placeholder = " 邮箱 (必填)"
        bTextFile.borderStyle = .line
        bTextFile.textAlignment = .center
        bTextFile.font = UIFont.systemFont(ofSize: 13)
        self.view.addSubview(bTextFile)
        let cTextFile = UITextField.init(frame: CGRect(x: 10, y: bTextFile.mj_h + bTextFile.mj_y + 30, width: SCREEN_W - 20, height: 130))
        cTextFile.placeholder = "视频名称 & 视频播放连接 (必填)"
        cTextFile.borderStyle = .line
        cTextFile.textAlignment = .center
        cTextFile.font = UIFont.systemFont(ofSize: 13)
        self.view.addSubview(cTextFile)

    }
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
