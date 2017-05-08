//
//  ContentViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/27.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var start = 0
    var strategy = ""
    var contentCategoryId = String()
    var count = CGFloat()
    var swipeView = UIView()
    let ShareView = UIView()
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 74 - 5 + 30, width: SCREEN_W, height: SCREEN_H - 99))
        tableView.register(UINib.init(nibName: "FindTouchCell", bundle: nil), forCellReuseIdentifier: "FindTouchCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
       // tableView.bounces = false 弹簧效果
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.start = 0
            self.updata()
        })
        tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            self.start += 10
            self.updata()
        })
        self.view.addSubview(tableView)
        return tableView
    }()
    //
    var imageArray = NSMutableArray()
    var dataArray = NSMutableArray()
    var webArray = NSMutableArray()
    let aView = UIView()
    let bView = UIView()
    let lBtn = UIButton()
    let rBtn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.tabBarController?.tabBar.isHidden = true
        self.view.backgroundColor = UIColor.white
//        let a = UIFont.familyNames()
//        print(a)
        self.updata()
        self.automaticallyAdjustsScrollViewInsets = false
        self.createViews()
        self.automaticallyAdjustsScrollViewInsets = false
        
    }
    func updata()->Void{
        TouchModel.requestFindTouchData(self.start, categoryId: self.contentCategoryId, strategy: self.strategy) { (array, imageArray, webArray, error) in
            self.dataArray.addObjects(from: array!)
            self.imageArray.addObjects(from: imageArray!)
            self.tableView.reloadData()
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            self.swipeView.frame  = CGRect(x: 0, y: 0, width: 10, height: 250 * self.count)
            self.tableView.addSubview(self.swipeView)
            self.swipeView.backgroundColor = UIColor.clear
            let rightSwipe = UISwipeGestureRecognizer.init(target: self, action: #selector(self.backBtnClick))
            self.swipeView.addGestureRecognizer(rightSwipe)
        }
    }
    func createViews() -> Void {
        let view = UIImageView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: 100))
        view.backgroundColor = UIColor.init(red: 246 / 255, green: 246 / 255, blue: 246 / 255 , alpha: 0.5)
        self.view.addSubview(view)
        //
        lBtn.frame = CGRect(x: (SCREEN_W - 140) / 3, y: 74 - 5, width: 70, height: 23)
        rBtn.frame =  CGRect(x: (SCREEN_W - 140) / 3 + 70 + (SCREEN_W - 140) / 3, y: 74 - 5, width: 70, height: 23)
        lBtn.setTitle("按时间排序", for: UIControlState())
        rBtn.setTitle("分享排行榜", for: UIControlState())
      //  lLabel.font = UIFont.init(name: "", size: 28)
        lBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        rBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        lBtn.setTitleColor(UIColor.black, for: UIControlState())
        rBtn.setTitleColor(UIColor.black, for: UIControlState())
        lBtn.setTitleColor(UIColor.cyan, for: UIControlState())
        lBtn.tag = 1
        rBtn.tag = 2
        self.view.addSubview(lBtn)
        self.view.addSubview(rBtn)
        lBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        rBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        //
        let backBtnImage = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        let backItem = UIBarButtonItem.init(image: backBtnImage, style: .done, target: self, action:#selector(self.backBtnClick))
        self.navigationItem.leftBarButtonItem = backItem
        //
        aView.frame = CGRect(x: lBtn.mj_x - 3, y: lBtn.mj_y - 1, width: lBtn.mj_w + 6, height: 1)
        aView.backgroundColor = UIColor.black
        bView.frame = CGRect(x: lBtn.mj_x - 3, y: lBtn.mj_y + lBtn.mj_h + 1, width: lBtn.mj_w + 6, height: 1)
        bView.backgroundColor = UIColor.black
        self.view.addSubview(aView)
        self.view.addSubview(bView)
    }
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    func btnClick(_ sender:UIButton) -> Void {
        UIView.animate(withDuration: 0.5, animations: {
            switch sender.tag {
            case 1:
                self.aView.frame = CGRect(x: self.lBtn.mj_x - 3, y: self.lBtn.mj_y - 1, width: self.lBtn.mj_w + 6, height: 1)
                self.bView.frame = CGRect(x: self.lBtn.mj_x - 3, y: self.lBtn.mj_y + self.lBtn.mj_h + 1, width: self.lBtn.mj_w + 6, height: 1)
                self.lBtn.setTitleColor(UIColor.cyan, for: UIControlState())
                self.rBtn.setTitleColor(UIColor.black, for: UIControlState())
                self.strategy = "date"
                self.dataArray.removeAllObjects()
                self.imageArray.removeAllObjects()
                self.updata()
            default:
                self.aView.frame = CGRect(x: self.rBtn.mj_x - 3, y: self.rBtn.mj_y - 1, width: self.rBtn.mj_w + 6, height: 1)
                self.bView.frame = CGRect(x: self.rBtn.mj_x - 3, y: self.rBtn.mj_y + self.rBtn.mj_h + 1, width: self.rBtn.mj_w + 6, height: 1)
                self.rBtn.setTitleColor(UIColor.cyan, for: UIControlState())
                self.lBtn.setTitleColor(UIColor.black, for: UIControlState())
                self.strategy = "shareCount"
                self.dataArray.removeAllObjects()
                self.imageArray.removeAllObjects()
                self.updata()
            }
        }) 
    }
}

extension ContentViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let arr = self.dataArray[section] as! [AnyObject]
//        return arr.count
        count = CGFloat(imageArray.count)
        return imageArray.count
    }
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FindTouchCell", for: indexPath) as! FindTouchCell
//        let sectionArray = self.dataArray[indexPath.section] as! [TouchModel]
//        let model = sectionArray[indexPath.row]
//        let sectionArray1 = self.imageArray[indexPath.section] as! [TouchModel]
        //let model1 = sectionArray1[indexPath.row]
        let model = dataArray[(indexPath as NSIndexPath).row] as! TouchModel
        let model1 = imageArray[(indexPath as NSIndexPath).row] as! TouchModel
        cell.feedImageView.sd_setImage(with: URL.init(string: model1.feed))
        cell.titleLabel.text = model.title
        cell.categoryLabel.text = model.category
        cell.releaseTimeLabel.text = String.init(format: "%.2ld' %.2ld''", Int(model.duration)! / 60, Int(model.duration)! % 60)
        return cell
    }
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let sectionArray = self.webArray[indexPath.section] as! [TouchModel]
//        let model = sectionArray[indexPath.row]
        //let webVC = FindWebViewController()
        //self.navigationController?.pushViewController(webVC, animated: true)
        // webVC.webStr = model.raw ==>>> webView 网页
        
        let FSVC = FindSecondView()
        FSVC.index = CGFloat((indexPath as NSIndexPath).row)
        FSVC.dataArray = self.dataArray
        FSVC.imageArray = self.imageArray
        self.viewWillAppear(true)
        self.navigationController?.pushViewController(FSVC, animated: true)
//        let sectionArray = self.dataArray[indexPath.section] as! [TouchModel]
//        let model = sectionArray[indexPath.row]
//        let sectionArray1 = self.imageArray[indexPath.section] as! [TouchModel]
//        let model1 = sectionArray1[indexPath.row]
//        let model = dataArray[indexPath.row] as! TouchModel
//        let model1 = imageArray[indexPath.row] as! TouchModel
//        FSVC.FSDetialView = model1.feed
//        FSVC.FSTitle = model.title
//        FSVC.FSCategory = model.category
//        FSVC.FSReleaseTime = model.duration
//        FSVC.FSPlayUrl = model.playUrl
//        FSVC.FSBlurred = model1.blurred
//        FSVC.FSDescription = model.Description
    }
}












