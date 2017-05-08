//
//  MineViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/20.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    let mineView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    
    func createView() -> Void {
        //
        let fRightImage = UIImage.init(named: "icon-ddxq-lxkf")?.withRenderingMode(.alwaysOriginal)
        let fRightItem = UIBarButtonItem.init(image: fRightImage, style: .done, target: self, action:#selector(self.btnClick(_:)) )
        self.navigationItem.rightBarButtonItem = fRightItem
        fRightItem.tag = 9
        //200-60
        let viewImageView = UIImageView.init(frame: CGRect(x: (SCREEN_W - 100) / 2, y: 4, width: 100, height: 30))
        let viewImage = UIImage.init(named: "200-60")
        viewImageView.image = viewImage
        self.navigationItem.titleView = viewImageView
        //
        scrollView.contentSize = CGSize(width: SCREEN_W, height: 700 + SCREEN_H + 90)
        scrollView.bounces = true
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isUserInteractionEnabled = true
        //
         mineView.frame = CGRect(x: 0, y: 0, width: SCREEN_W, height: 700 + SCREEN_H + 90)
        mineView.isUserInteractionEnabled = true
        self.view.isUserInteractionEnabled = true
        self.scrollView.addSubview(mineView)
        // 头像
        let iconBtn = UIButton.init(type: .custom)
        iconBtn.frame = CGRect(x: (SCREEN_W - 100) / 2, y: 20, width: 100, height: 100)
        iconBtn.setImage(UIImage.init(named: "1212"), for: UIControlState())
        iconBtn.layer.cornerRadius = iconBtn.frame.size.height / 2
        iconBtn.clipsToBounds = true
        iconBtn.tag = 1
        iconBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: UIControlEvents.touchUpInside)
        mineView.addSubview(iconBtn)
        // 文本框
        let textFild = UITextField.init(frame: CGRect(x: (SCREEN_W - 120) / 2,y: iconBtn.mj_h + 20 + 8, width: 120, height: 35))
        textFild.placeholder = "编辑用户昵称"
        textFild.textAlignment = .center
        textFild.font = UIFont.systemFont(ofSize: 13)
        mineView.addSubview(textFild)
        // 灰线
        let vView = UIView.init(frame: CGRect(x: (SCREEN_W - 1) / 2 ,y: textFild.mj_h +  textFild.mj_y + 10, width: 1, height: 40))
        vView.backgroundColor = UIColor.gray
        mineView.addSubview(vView)
        let hView = UIView.init(frame: CGRect(x: 0, y: vView.mj_y + vView.mj_h + 8, width: SCREEN_W, height: 1))
        hView.backgroundColor = UIColor.gray
        mineView.addSubview(hView)
        // 左右 Btn
        let lBtn = UIButton.init(type: .custom)
        let rBtn = UIButton.init(type: .custom)
        lBtn.frame = CGRect(x: 0, y: textFild.mj_h + textFild.mj_y + 17,width: (SCREEN_W - 1) / 2, height: 30)
        rBtn.frame = CGRect(x: lBtn.mj_w + 1, y: textFild.mj_h + textFild.mj_y + 17, width: (SCREEN_W - 1) / 2, height: 30)
        lBtn.setTitle("❤️ 我的收藏", for: UIControlState())
        lBtn.setTitleColor(UIColor.black, for: UIControlState())
        lBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        rBtn.setTitle("🌞 我的评论", for: UIControlState())
        rBtn.setTitleColor(UIColor.black, for: UIControlState())
        rBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        lBtn.tag = 2
        rBtn.tag = 3
        lBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: UIControlEvents.touchUpInside)
        rBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: UIControlEvents.touchUpInside)
        mineView.addSubview(lBtn)
        mineView.addSubview(rBtn)
        // 竖直5Btn
        let aBtn = UIButton.init(type: .custom)
        aBtn.frame = CGRect(x: (SCREEN_W - 120) / 2, y: hView.mj_y +  50, width: 120, height: 30)
        aBtn.setTitle("我的消息", for: UIControlState())
        aBtn.setTitleColor(UIColor.black, for: UIControlState())
        aBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        mineView.addSubview(aBtn)
        let bBtn = UIButton.init(type: .custom)
        bBtn.frame = CGRect(x: (SCREEN_W - 120) / 2, y: aBtn.mj_y +  80, width: 120, height: 30)
        bBtn.setTitle("我的缓存", for: UIControlState())
        bBtn.setTitleColor(UIColor.black, for: UIControlState())
        bBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        mineView.addSubview(bBtn)
        let cBtn = UIButton.init(type: .custom)
        cBtn.frame = CGRect(x: (SCREEN_W - 120) / 2, y: bBtn.mj_y +  80, width: 120, height: 30)
        cBtn.setTitle("功能开关", for: UIControlState())
        cBtn.setTitleColor(UIColor.black, for: UIControlState())
        cBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        mineView.addSubview(cBtn)
        let dBtn = UIButton.init(type: .custom)
        dBtn.frame = CGRect(x: (SCREEN_W - 120) / 2, y: cBtn.mj_y +  80, width: 120, height: 30)
        dBtn.setTitle("我要投稿", for: UIControlState())
        dBtn.setTitleColor(UIColor.black, for: UIControlState())
        dBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        mineView.addSubview(dBtn)
        let eBtn = UIButton.init(type: .custom)
        eBtn.frame = CGRect(x: (SCREEN_W - 120) / 2, y: dBtn.mj_y +  80, width: 120, height: 30)
        eBtn.setTitle("意见反馈", for: UIControlState())
        eBtn.setTitleColor(UIColor.black, for: UIControlState())
        eBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        mineView.addSubview(eBtn)
        aBtn.tag = 4
        bBtn.tag = 5
        cBtn.tag = 6
        dBtn.tag = 7
        eBtn.tag = 8
        aBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: UIControlEvents.touchUpInside)
        bBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: UIControlEvents.touchUpInside)
        cBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: UIControlEvents.touchUpInside)
        dBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: UIControlEvents.touchUpInside)
        eBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: UIControlEvents.touchUpInside)
        // 版本信息
        let label = UILabel.init(frame: CGRect(x: 0, y: dBtn.mj_h + dBtn.mj_y + 130, width: SCREEN_W, height: 20))
        label.text = "version 2.6.0 build 1209"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        mineView.addSubview(label)
        //360-180
        let aimageView = UIImageView.init(frame: CGRect(x: (SCREEN_W - 180) / 2, y: 700, width: 180, height: 90))
        let aimage = UIImage.init(named: "360-180")
        aimageView.image = aimage
        mineView.addSubview(aimageView)
        //
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 700 + aimageView.mj_h, width: SCREEN_W, height: SCREEN_H))
        let image = UIImage.init(named: "IMG_2690.JPG")
        imageView.image = image
        mineView.addSubview(imageView)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.mineView.endEditing(true)
        self.view.endEditing(true)
        self.scrollView.endEditing(true)
    }
    func btnClick(_ sender:UIButton) -> Void {
        switch sender.tag{
        case 1:
            let ac = UIAlertController.init(title: "选择照片", message: nil, preferredStyle: .actionSheet)
            let action = UIAlertAction.init(title: "相机", style: .default) { (action) in
            }
            ac.addAction(action)
            let bAction = UIAlertAction.init(title: "相册", style: .default) { (action) in
            }
            ac.addAction(bAction)
            self.present(ac, animated: true, completion: nil)
        case 2:
            let CVC = PushCollect()
            self.navigationController?.pushViewController(CVC, animated: true)
        case 3:
            let PVC = PushLogin()
            self.navigationController?.pushViewController(PVC, animated: true)
        case 4:
            let PVC = PushLogin()
            self.navigationController?.pushViewController(PVC, animated: true)
        case 5:
            let PVC = PushLogin()
            self.navigationController?.pushViewController(PVC, animated: true)
        case 6:
            let SVC = PushSwich()
            self.navigationController?.pushViewController(SVC, animated: true)
        case 7:
            let WVC = PushWrite()
            self.navigationController?.pushViewController(WVC, animated: true)
        case 8:
            let IVC = PushIdea()
            self.navigationController?.pushViewController(IVC, animated: true)
        default:
            let MVC = PushMore()
            self.navigationController?.pushViewController(MVC, animated: true)
        }
    }
}
