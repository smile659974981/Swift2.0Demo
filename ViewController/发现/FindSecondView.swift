//
//  FindSecondView.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/12.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class FindSecondView: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var bacView = UIView()
    var index = CGFloat()
    var lLabel = UILabel()
    var rLabel = UILabel()
    var mLabel = UILabel()
    var FSPlayUrl:String = ""
    var imageArray = NSMutableArray()
    var dataArray = NSMutableArray()
    var webArray = NSMutableArray()
    lazy var contentView : UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        let contentView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: SCREEN_H - 35), collectionViewLayout: layout)
        contentView.delegate = self
        contentView.dataSource = self
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        contentView.showsVerticalScrollIndicator = false
        contentView.isPagingEnabled = true
        contentView.register(UINib.init(nibName: "FindSecondCell", bundle: nil), forCellWithReuseIdentifier: "FindSecondCell")
        self.view.addSubview(contentView)
        contentView.backgroundColor = UIColor.clear
        return contentView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        self.createViews()
        self.automaticallyAdjustsScrollViewInsets = false
        contentView.contentOffset = CGPoint(x: index * SCREEN_W, y: 0)
        self.contentView.reloadData()
    }
    func createViews() -> Void {
        bacView.frame = CGRect(x: 0, y: contentView.mj_h, width: SCREEN_W, height: SCREEN_H - contentView.mj_h)
        bacView.backgroundColor = UIColor.init(red: 52 / 255.0, green: 137 / 255.0, blue: 155 / 255.0, alpha: 0.95)
        self.view.addSubview(bacView)
        mLabel.frame = CGRect(x: (SCREEN_W / 2) - (15 / 2),  y: contentView.mj_h + 17, width: 6, height: 2)
        lLabel.frame = CGRect(x: mLabel.mj_x - 33,  y: contentView.mj_h + 10, width: 30, height: 20)
        rLabel.frame =  CGRect(x: mLabel.mj_x  + mLabel.mj_w + 3, y: contentView.mj_h + 10, width: 30, height: 20)
        lLabel.font = UIFont.boldSystemFont(ofSize: 14)
        rLabel.font = UIFont.boldSystemFont(ofSize: 14)
        lLabel.textColor = UIColor.white
        rLabel.textColor = UIColor.white
        mLabel.backgroundColor = UIColor.white
        lLabel.textAlignment = .right
        self.view.addSubview(lLabel)
        self.view.addSubview(rLabel)
        self.view.addSubview(mLabel)
        let swipeVIew = UIView.init(frame: CGRect(x: 0, y: 64, width: 10, height: SCREEN_H - 64))
        swipeVIew.backgroundColor = UIColor.clear
        self.view.addSubview(swipeVIew)
        let rightSwipe = UISwipeGestureRecognizer.init(target: self, action: #selector(self.backBtnClick))
        swipeVIew.addGestureRecognizer(rightSwipe)
  
}
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
        self.navigationController?.isNavigationBarHidden = false
    }
    func playVideo() -> Void {
        let playerVC = AVPlayerViewController()
        playerVC.player = AVPlayer.init(url: URL.init(string: FSPlayUrl)!)
        self.navigationController?.present(playerVC, animated: true, completion: {
            playerVC.player?.play()
        })
    }
}

extension FindSecondView{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    @objc(collectionView:cellForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FindSecondCell", for: indexPath) as! FindSecondCell
        let model = dataArray[(indexPath as NSIndexPath).row] as! TouchModel
        let model1 = imageArray[(indexPath as NSIndexPath).row] as! TouchModel
        cell.detialView.sd_setImage(with: URL.init(string: model1.feed))
        cell.titleLabel.text = model.title
        cell.categoryLabel.text = model.category
        cell.blurredImage.sd_setImage(with: URL.init(string: model1.blurred))
        cell.DescriptionLabel.text = model.Description
        cell.releaseTimeLabel.text = String.init(format: "%.2ld' %.2ld''", Int(model.duration)! / 60, Int(model.duration)! % 60)
        lLabel.text = String((indexPath as NSIndexPath).item + 1)
        rLabel.text = String(dataArray.count)
       // imageView.sd_setImageWithURL(NSURL.init(string: model1.blurred))
        self.FSPlayUrl = model.playUrl
        cell.backBtn.addTarget(self, action: #selector(self.backBtnClick), for: .touchUpInside)
        cell.playBtn.addTarget(self, action: #selector(self.playVideo), for: .touchUpInside)
        return cell
    }
    @objc(collectionView:layout:sizeForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREEN_W, height: SCREEN_H - 35)
    }
}
