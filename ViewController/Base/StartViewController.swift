//
//  StartViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/24.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class StartViewController: UIViewController {
    
    var playBtn = UIButton()
    var stopBtn = UIButton()
    var nextBtn = UIButton()
    var lastBtn = UIButton()
    var player:AVPlayer?
    var count = 0
    var musicArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        let  musicArr = ["陈粒-光.mp3","","陈粒-历历万乡.mp3"]
        self.createViews()
        stopBtn.isHidden = true
        playBtn.isHidden = false
        for i in musicArr{
            musicArray.add(i)
        }
    }
    func createViews() -> Void {
        let imageView = UIImageView.init(frame: self.view.bounds)
        imageView.image = UIImage.init(named: "IMG_2228.jpg")
        self.view.addSubview(imageView)
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect(x: SCREEN_W / 2 - 50, y: SCREEN_H - 70, width: 100, height: 30)
        btn.setTitle("进 入 孑 孓", for: UIControlState())
        btn.setTitleColor(UIColor.white, for: UIControlState())
        btn.layer.cornerRadius = 5
        btn.layer.borderColor =  UIColor(red: 246/255, green: 2467/255, blue: 246/255, alpha: 1).cgColor
        btn.layer.borderWidth = 1
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        btn.tag = 5
        btn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
        playBtn.frame = CGRect(x: SCREEN_W / 2 - 25, y: SCREEN_H - 300, width: 50, height: 50)
        stopBtn.frame = CGRect(x: SCREEN_W / 2 - 25, y: SCREEN_H - 300, width: 50, height: 50)
        playBtn.tag = 1
        stopBtn.tag = 2
        playBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        stopBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        playBtn.setImage(UIImage.init(named: "player_handle_touch"), for: UIControlState())
        stopBtn.setImage(UIImage.init(named: "btn_pause"), for: UIControlState())
        self.view.addSubview(playBtn)
        self.view.addSubview(stopBtn)
        lastBtn.frame = CGRect(x: 80, y: playBtn.mj_y, width: 50, height: 50)
        nextBtn.frame = CGRect(x: SCREEN_W - 130, y: playBtn.mj_y, width: 50, height: 50)
        lastBtn.setTitle("孑", for: UIControlState())
        nextBtn.setTitle("孓", for: UIControlState())
        lastBtn.setTitleColor(UIColor.white, for: UIControlState())
        nextBtn.setTitleColor(UIColor.white, for: UIControlState())
        lastBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        nextBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        lastBtn.tag = 3
        nextBtn.tag = 4
        lastBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
      //  self.view.addSubview(lastBtn)
    // self.view.addSubview(nextBtn)
    }
    func btnClick(_ sender:UIButton) -> Void {
        switch sender.tag {
        case 1:
            stopBtn.isHidden = false
            playBtn.isHidden = true
            if player != nil{
                player?.play()
            } else {
                self.playMusic(count)
            }
        case 2:
            stopBtn.isHidden = true
            playBtn.isHidden = false
            player?.pause()
//        case 3:
//            if count <= musicArray.count - 2 {
//                count = 2
//            } else {
//                count -= 1
//            }
//            self.playMusic(count)
//        case 4:
//            if count >= musicArray.count - 1{
//                count = 0
//            } else {
//                count += 1
//            }
//            self.playMusic(count)
        default:
            self.viewWillAppear(true)
            let viewController = HomeViewController()
            self.present(viewController, animated: false, completion:nil)
        }
    }
    func playMusic(_ count: Int)->Void{
        player = nil
        let path = Bundle.main.path(forResource: musicArray[count] as? String, ofType: nil)
        player = AVPlayer.init(url: URL.init(fileURLWithPath: path!))
        player?.play()
    }
}
