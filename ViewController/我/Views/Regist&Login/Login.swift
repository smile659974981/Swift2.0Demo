//
//  Login.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/28.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class Login: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = true
        self.createViews()
    }
    func createViews() -> Void {
        //
        let Btn = UIButton.init(type: .custom)
        Btn.frame = CGRect( x: 10, y: 30, width: 40, height: 40)
        Btn.setImage(UIImage.init(named: "back"), for: UIControlState())
        self.view.addSubview(Btn)
        Btn.addTarget(self, action: #selector(self.backBtnClick), for: .touchUpInside)
        //
        let aTextFile = UITextField.init(frame: CGRect(x: 10, y: 120, width: SCREEN_W - 20, height: 35))
        aTextFile.placeholder = "手机号码"
        aTextFile.borderStyle = .line
        aTextFile.textAlignment = .center
        aTextFile.font = UIFont.systemFont(ofSize: 13)
        self.view.addSubview(aTextFile)
        let bTextFile = UITextField.init(frame: CGRect(x: 10, y: aTextFile.mj_h + aTextFile.mj_y + 60, width: SCREEN_W - 20, height: 35))
        bTextFile.placeholder = "昵称"
        bTextFile.borderStyle = .line
        bTextFile.textAlignment = .center
        bTextFile.font = UIFont.systemFont(ofSize: 13)
        self.view.addSubview(bTextFile)
        let cTextFile = UITextField.init(frame: CGRect(x: 10,  y: bTextFile.mj_h + bTextFile.mj_y + 60, width: SCREEN_W - 20, height: 35))
        cTextFile.placeholder = "密码"
        cTextFile.borderStyle = .line
        cTextFile.textAlignment = .center
        cTextFile.font = UIFont.systemFont(ofSize: 13)
        self.view.addSubview(cTextFile)
        let dTextFile = UITextField.init(frame: CGRect(x: 10,  y: cTextFile.mj_h + cTextFile.mj_y + 60, width: SCREEN_W - 20, height: 35))
        dTextFile.placeholder = "确认密码"
        dTextFile.borderStyle = .line
        dTextFile.textAlignment = .center
        dTextFile.font = UIFont.systemFont(ofSize: 13)
        self.view.addSubview(dTextFile)
        //
        let lBtn = UIButton.init(type: .custom)
        let rBtn = UIButton.init(type: .custom)
        lBtn.frame = CGRect(x: 20, y: SCREEN_H - 100, width: 120, height: 35)
        rBtn.frame = CGRect(x: SCREEN_W - 120 - 20, y: SCREEN_H - 100, width: 120, height: 35)
        lBtn.layer.cornerRadius = 5
        rBtn.layer.cornerRadius = 5
        lBtn.layer.borderColor =  UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        rBtn.layer.borderColor =  UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        lBtn.layer.borderWidth = 1
        rBtn.layer.borderWidth = 1
        lBtn.setTitle("取消", for: UIControlState())
        rBtn.setTitle("提交", for: UIControlState())
        lBtn.setTitleColor(UIColor.black, for: UIControlState())
        rBtn.setTitleColor(UIColor.black, for: UIControlState())
        lBtn.tag = 1
        rBtn.tag = 2
        lBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        rBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        self.view.addSubview(lBtn)
        self.view.addSubview(rBtn)
    }
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
    }
    func btnClick(_ sender:UIButton) -> Void {
        switch sender.tag {
        case 1:
            self.navigationController!.popViewController(animated: true)
        default:
            let ac = UIAlertController.init(title: "提示", message: "注册成功", preferredStyle: .alert)
            let action = UIAlertAction.init(title: "好", style: UIAlertActionStyle.cancel) { (action) in
            }
            ac.addAction(action)
            self.present(ac, animated: true, completion: nil)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
