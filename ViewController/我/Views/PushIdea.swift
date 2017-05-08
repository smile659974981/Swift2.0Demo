//
//  PushIdea.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/27.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class PushIdea: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = UIColor.white
        self.createViews()
    }
    func createViews() -> Void {
        //
        let touGao = UIBarButtonItem.init(title: "发送", style: UIBarButtonItemStyle.done, target: nil, action: nil)
        touGao.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.gray], for: UIControlState())
        self.navigationItem.rightBarButtonItem = touGao
        //
        let backBtnImage = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        let backItem = UIBarButtonItem.init(image: backBtnImage, style: .done, target: self, action:#selector(self.backBtnClick))
        self.navigationItem.leftBarButtonItem = backItem
        self.navigationController?.navigationItem.title = "意见反馈"
        //
        let aTextFile = UITextField.init(frame: CGRect(x: 10,y: 240, width: SCREEN_W - 20, height: 130))
        aTextFile.placeholder = "请告诉我们你遇到的问题或想反馈的意见 (必填)"
        aTextFile.borderStyle = .line
        aTextFile.textAlignment = .center
        aTextFile.font = UIFont.systemFont(ofSize: 13)
        self.view.addSubview(aTextFile)
        let bTextFile = UITextField.init(frame: CGRect(x: 10, y: aTextFile.mj_h + aTextFile.mj_y + 30, width: SCREEN_W - 20, height: 40))
        bTextFile.placeholder = "邮箱 (必填)"
        //bTextFile
        bTextFile.borderStyle = .line
        bTextFile.textAlignment = .center
        bTextFile.font = UIFont.systemFont(ofSize: 13)
        self.view.addSubview(bTextFile)
    }
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
