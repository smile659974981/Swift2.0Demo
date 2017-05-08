//
//  GuideViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/24.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController,UIScrollViewDelegate {

    let nameArr = ["IMG_2692.JPG","IMG_2690.JPG","IMG_2694.JPG"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //scrollView的初始化
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        scrollView.delegate = self
        //为了能让内容横向滚动，设置横向内容宽度为3个页面的宽度总和
        scrollView.contentSize = CGSize(width: SCREEN_W * CGFloat(nameArr.count),height: 0)
        scrollView.contentOffset = CGPoint.init(x: SCREEN_W, y: 0)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        for i in 0..<nameArr.count{
            let imgView = UIImageView.init(frame: CGRect(x: SCREEN_W * CGFloat(i), y: 0, width: SCREEN_W, height: SCREEN_H))
            imgView.image = UIImage.init(named: nameArr[i])
            scrollView.addSubview(imgView)
        }
            scrollView.contentOffset = CGPoint.zero
            self.view.addSubview(scrollView)
    }
    //scrollview滚动的时候就会调用
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let twidth = CGFloat(nameArr.count - 1) * self.view.bounds.size.width
        //如果在最后一个页面继续滑动的话就会跳转到主页面
        if(scrollView.contentOffset.x > twidth)
        {
            let viewController = HomeViewController()
            self.viewWillAppear(true)
            self.present(viewController, animated: false, completion:nil)
        }
    }
}
