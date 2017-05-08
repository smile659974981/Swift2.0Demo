//
//  PushLogin.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/27.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class PushLogin: UIViewController {
    let clearView = UIView()
    let nameArr = ["IMG_2692.JPG","IMG_2690.JPG","IMG_2694.JPG","IMG_2695.JPG","IMG_2696.JPG","thumb_IMG_3895_1024.jpg","IMG_2228.jpg","IMG_2229.jpg","IMG_2232.jpg","IMG_2235.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = true
        // 跳转时关闭状态栏那20的空白
        self.automaticallyAdjustsScrollViewInsets = false
        //
//        self.navigationController?.navigationBar.translucent = true
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        let label = UILabel.init(frame: CGRectMake(0, 0, SCREEN_W, 58))
//        label.backgroundColor = UIColor.init(red: 246 / 256, green: 246 / 256, blue: 246 / 256, alpha: 0.9)
        self.navigationController?.isNavigationBarHidden = true
        //
        let msv = MyScrollView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: SCREEN_H), arr: nameArr, isTimer: true)
        self.view.addSubview(msv)
        //
        clearView.frame = CGRect(x: 0, y: 0, width: SCREEN_W, height: SCREEN_H)
        clearView.isUserInteractionEnabled = true
        self.view.addSubview(clearView)
        //
        let Btn = UIButton.init(type: .custom)
        Btn.frame = CGRect( x: 10, y: 30, width: 40, height: 40)
        Btn.setImage(UIImage.init(named: "backw"), for: UIControlState())
        clearView.addSubview(Btn)
        Btn.addTarget(self, action: #selector(self.backBtnClick), for: .touchUpInside)
        //
        let lBtn = UIButton.init(type: .custom)
        let rBtn = UIButton.init(type: .custom)
        lBtn.frame = CGRect(x: 20, y: SCREEN_H - 100, width: 120, height: 35)
        rBtn.frame = CGRect(x: SCREEN_W - 120 - 20, y: SCREEN_H - 100, width: 120, height: 35)
        lBtn.layer.cornerRadius = 5
        rBtn.layer.cornerRadius = 5
        lBtn.layer.borderColor =  UIColor(red: 246/255, green: 2467/255, blue: 246/255, alpha: 1).cgColor
        rBtn.layer.borderColor =  UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1).cgColor
        lBtn.layer.borderWidth = 1
        rBtn.layer.borderWidth = 1
        lBtn.setTitle("注册", for: UIControlState())
        rBtn.setTitle("登录", for: UIControlState())
        lBtn.setTitleColor(UIColor.init(red: 246/255, green: 246/255, blue: 246/255, alpha:1), for: UIControlState())
        rBtn.setTitleColor(UIColor.init(red: 246/255, green: 246/255, blue: 246/255, alpha:1), for: UIControlState())
        lBtn.tag = 1
        rBtn.tag = 2
        lBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        rBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        clearView.addSubview(lBtn)
        clearView.addSubview(rBtn)
        //
        
    }
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.clearView.endEditing(true)
    }
    func btnClick(_ sender:UIButton) -> Void {
        switch sender.tag {
        case 1:
            let LVC = Login()
            self.navigationController?.pushViewController(LVC, animated: true)
        default:
            let RVC = Regist()
            self.navigationController?.pushViewController(RVC, animated: true)
        }
    }
}
