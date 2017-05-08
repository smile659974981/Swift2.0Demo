//
//  FindWebViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/11.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class FindWebViewController: UIViewController,UIWebViewDelegate {
    
    var webStr:String = ""
    let webView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.view.backgroundColor = UIColor.white
        self.createViews()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    func createViews() -> Void {
        let url = URL.init(string: webStr)
        let request = URLRequest.init(url: url!)
        webView.frame = CGRect(x: 0, y: -64, width: SCREEN_W, height: SCREEN_H + 64)
        webView.loadRequest(request)
        self.view.addSubview(webView)
        let backBtnImage = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        let backItem = UIBarButtonItem.init(image: backBtnImage, style: .done, target: self, action:#selector(self.backBtnClick))
        self.navigationItem.leftBarButtonItem = backItem
    }
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
}
