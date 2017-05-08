//
//  MyScrollView.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/27.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class MyScrollView: UIScrollView, UIScrollViewDelegate {
    
    var nameArr: [String]!
    
    init(frame: CGRect, arr: [String]?, isTimer: Bool = false) {
        super.init(frame: frame)
        if arr == nil {
            return
        }
        nameArr = arr
        nameArr.insert(nameArr[nameArr.count - 1], at: 0)
        nameArr.append(nameArr[1])
        
        var rect = frame
        for i in 0..<nameArr.count {
            rect.origin.x = frame.size.width * CGFloat(i)
            rect.origin.y = 0
            let iv = UIImageView.init(frame: rect)
            iv.image = UIImage.init(named: nameArr[i])
            self.addSubview(iv)
        }
        self.contentSize = CGSize.init(width: Int(frame.width) * nameArr.count, height: 0)
        self.contentOffset = CGPoint(x: frame.width, y: 0)
        self.isPagingEnabled = false
        self.delegate = self
        if isTimer == false {
            return
        }
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.timeRun), userInfo: nil, repeats: true)
    }
    
    func timeRun() -> Void {
        var page = Int(self.contentOffset.x / self.frame.width)
        page += 1
        if page == nameArr.count - 1 {
            self.contentOffset = CGPoint.zero
            page = 1
        }
        self.setContentOffset(CGPoint(x: CGFloat(page) * self.frame.width, y: 0), animated: true)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x == 0 {
            scrollView.contentOffset = CGPoint(x: CGFloat(nameArr.count - 2) * scrollView.frame.width, y: 0)
        } else if scrollView.contentOffset.x == CGFloat(nameArr.count - 1) * scrollView.frame.width {
            scrollView.contentOffset = CGPoint(x: scrollView.frame.width, y: 0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
