//
//  Regist.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/28.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class Regist: UIViewController {

    var LoginView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = true
        self.createViews()
    }
    func createViews() -> Void {
        //
        LoginView = UIView.init(frame: CGRect(x: 0, y: SCREEN_H, width: SCREEN_W, height: 120))
        LoginView.backgroundColor = UIColor.white
        self.view.addSubview(LoginView)
        //
        let qqBtn = UIButton.init(type: .custom)
        qqBtn.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        qqBtn.setImage(UIImage.init(named: "icon-qq"), for: UIControlState())
        LoginView.addSubview(qqBtn)
        let wbBtn = UIButton.init(type: .custom)
        wbBtn.frame = CGRect(x: SCREEN_W - 110, y: 10, width: 100, height: 100)
        wbBtn.setImage(UIImage.init(named: "icon-weibo"), for: UIControlState())
        LoginView.addSubview(wbBtn)
        let wxBtn = UIButton.init(type: .custom)
        wxBtn.frame = CGRect(x: (SCREEN_W - 100) / 2, y: 10, width: 100, height: 100)
        wxBtn.setImage(UIImage.init(named: "icon-weixin"), for: UIControlState())
        LoginView.addSubview(wxBtn)
        //
        let Btn = UIButton.init(type: .custom)
        Btn.frame = CGRect( x: 10, y: 30, width: 40, height: 40)
        Btn.setImage(UIImage.init(named: "back"), for: UIControlState())
        self.view.addSubview(Btn)
        Btn.addTarget(self, action: #selector(self.backBtnClick), for: .touchUpInside)
        //
        let aTextFile = UITextField.init(frame: CGRect(x: 40, y: 120, width: SCREEN_W - 80, height: 35))
        aTextFile.placeholder = "账号"
        aTextFile.borderStyle = .line
        aTextFile.textAlignment = .center
        aTextFile.font = UIFont.systemFont(ofSize: 13)
        self.view.addSubview(aTextFile)
        let bTextFile = UITextField.init(frame: CGRect(x: 40, y: aTextFile.mj_h + aTextFile.mj_y + 60, width: SCREEN_W - 80, height: 35))
        bTextFile.placeholder = "密码"
        bTextFile.borderStyle = .line
        bTextFile.textAlignment = .center
        bTextFile.font = UIFont.systemFont(ofSize: 13)
        self.view.addSubview(bTextFile)
        //
        let lBtn = UIButton.init(type: .custom)
        let rBtn = UIButton.init(type: .custom)
        lBtn.frame = CGRect(x: 20, y: SCREEN_H - 170, width: 120, height: 35)
        rBtn.frame = CGRect(x: SCREEN_W - 120 - 20, y: SCREEN_H - 170, width: 120, height: 35)
        lBtn.layer.cornerRadius = 5
        rBtn.layer.cornerRadius = 5
        lBtn.layer.borderColor =  UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        rBtn.layer.borderColor =  UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        lBtn.layer.borderWidth = 1
        rBtn.layer.borderWidth = 1
        lBtn.setTitle("取消", for: UIControlState())
        rBtn.setTitle("登录", for: UIControlState())
        lBtn.setTitleColor(UIColor.black, for: UIControlState())
        rBtn.setTitleColor(UIColor.black, for: UIControlState())
        lBtn.tag = 1
        rBtn.tag = 2
        lBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        rBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        self.view.addSubview(lBtn)
        self.view.addSubview(rBtn)
        //
        let zBtn = UIButton.init(type: .custom)
        zBtn.frame = CGRect(x: (SCREEN_W - 120) / 2, y: SCREEN_H - 300, width: 120, height: 15)
        zBtn.layer.borderColor =  UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        zBtn.layer.borderWidth = 1
        zBtn.setTitle(" 第三方登录", for: UIControlState())
        zBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        zBtn.setTitleColor(UIColor.black, for: UIControlState())
        zBtn.tag = 3
        zBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        self.view.addSubview(zBtn)
    }
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
    }
    func btnClick(_ sender:UIButton) -> Void {
        switch sender.tag {
        case 1:
            self.navigationController!.popViewController(animated: true)
        case 2:
            let ac = UIAlertController.init(title: "提示", message: "登录成功", preferredStyle: .alert)
            let action = UIAlertAction.init(title: "好", style: UIAlertActionStyle.cancel) { (action) in
            }
            ac.addAction(action)
            self.present(ac, animated: true, completion: nil)
        default:
            UIView.animate(withDuration: 0.25, animations: {
                self.LoginView.frame = CGRect(x: 0, y: SCREEN_H - 120, width: SCREEN_W, height: 120)
                self.view.backgroundColor = UIColor.gray
            }) 
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        UIView.animate(withDuration: 0.25, animations: {
            self.LoginView.frame = CGRect(x: 0, y: self.view.frame.size.height , width: self.view.frame.size.width, height: 80)
            self.view.backgroundColor = UIColor.white
        }) 
    }
}
