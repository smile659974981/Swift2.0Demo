//
//  TopViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/17.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class TopViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var strategy = String("weekly")
    var imageArray = NSMutableArray()
    var dataArray = NSMutableArray()
    var count = CGFloat()
    var swipeView = UIView()
    let aView = UIView()
    let bView = UIView()
    let cView = UIView()
    let lBtn = UIButton()
    let rBtn = UIButton()
    let mBtn = UIButton()
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 74 - 5 + 30, width: SCREEN_W, height: SCREEN_H - 99))
        tableView.register(UINib.init(nibName: "TopCell", bundle: nil), forCellReuseIdentifier: "TopCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        self.view.addSubview(tableView)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.tabBarController?.tabBar.isHidden = true
        self.createViews()
        self.loadData()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    func createViews() -> Void {
        self.navigationItem.title = "排行榜"
        self.view.backgroundColor = UIColor.white
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: 100))
        view.backgroundColor = UIColor.init(red: 246 / 255, green: 246 / 255, blue: 246 / 255 , alpha: 1)
        self.view.addSubview(view)
        //
        lBtn.frame = CGRect(x: (SCREEN_W - 150) / 4, y: 74 - 5, width: 50, height: 23)
        mBtn.frame =  CGRect(x: (SCREEN_W - 140) / 4 + 50 + (SCREEN_W - 150) / 4, y: 74 - 5, width: 50, height: 23)
        rBtn.frame = CGRect(x: mBtn.mj_x + mBtn.mj_w + (SCREEN_W - 150) / 4,  y: 74 - 5, width: 50, height: 23)
        lBtn.setTitle("周排行", for: UIControlState())
        mBtn.setTitle("月排行", for: UIControlState())
        rBtn.setTitle("总排行", for: UIControlState())
        lBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        mBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        rBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        lBtn.setTitleColor(UIColor.black, for: UIControlState())
        mBtn.setTitleColor(UIColor.black, for: UIControlState())
        lBtn.setTitleColor(UIColor.cyan, for: UIControlState())
        rBtn.setTitleColor(UIColor.black, for: UIControlState())
        lBtn.tag = 1
        mBtn.tag = 2
        rBtn.tag = 3
        self.view.addSubview(lBtn)
        self.view.addSubview(mBtn)
        self.view.addSubview(rBtn)
        lBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        mBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
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
                self.mBtn.setTitleColor(UIColor.black, for: UIControlState())
                self.rBtn.setTitleColor(UIColor.black, for: UIControlState())
                self.dataArray.removeAllObjects()
                self.imageArray.removeAllObjects()
                self.strategy = "weekly"
                self.loadData()
            case 2:
                self.aView.frame = CGRect(x: self.mBtn.mj_x - 3, y: self.mBtn.mj_y - 1, width: self.mBtn.mj_w + 6, height: 1)
                self.bView.frame = CGRect(x: self.mBtn.mj_x - 3, y: self.mBtn.mj_y + self.mBtn.mj_h + 1, width: self.mBtn.mj_w + 6, height: 1)
                self.lBtn.setTitleColor(UIColor.black, for: UIControlState())
                self.mBtn.setTitleColor(UIColor.cyan, for: UIControlState())
                self.rBtn.setTitleColor(UIColor.black, for: UIControlState())
                self.dataArray.removeAllObjects()
                self.imageArray.removeAllObjects()
                self.strategy = "monthly"
                self.loadData()
            default:
                self.aView.frame = CGRect(x: self.rBtn.mj_x - 3, y: self.rBtn.mj_y - 1, width: self.rBtn.mj_w + 6, height: 1)
                self.bView.frame = CGRect(x: self.rBtn.mj_x - 3, y: self.rBtn.mj_y + self.rBtn.mj_h + 1, width: self.rBtn.mj_w + 6, height: 1)
                self.lBtn.setTitleColor(UIColor.black, for: UIControlState())
                self.mBtn.setTitleColor(UIColor.black, for: UIControlState())
                self.rBtn.setTitleColor(UIColor.cyan, for: UIControlState())
                self.dataArray.removeAllObjects()
                self.imageArray.removeAllObjects()
                self.strategy = "historical"
                self.loadData()
            }
        }) 
    }
    func loadData() -> Void {
        TopModel.requestTopModelData(self.strategy!) { (array, imageArray, webArray, error) in
            self.dataArray.addObjects(from: array!)
            self.imageArray.addObjects(from: imageArray!)
            self.tableView.reloadData()
            self.swipeView.frame  = CGRect(x: 0, y: 0, width: 10, height: 250 * self.count)
            self.tableView.addSubview(self.swipeView)
            self.swipeView.backgroundColor = UIColor.clear
            let rightSwipe = UISwipeGestureRecognizer.init(target: self, action: #selector(self.backBtnClick))
            self.swipeView.addGestureRecognizer(rightSwipe)
        }
    }
}
extension TopViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        count = CGFloat(imageArray.count)
        return imageArray.count
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopCell", for: indexPath) as! TopCell
        let model = dataArray[(indexPath as NSIndexPath).row] as! TouchModel
        let model1 = imageArray[(indexPath as NSIndexPath).row] as! TouchModel
        cell.feedImageView.sd_setImage(with: URL.init(string: model1.feed))
        cell.countLabel.text = "\((indexPath as NSIndexPath).row + 1)"
        cell.titleLabel.text = model.title
        cell.categoryLabel.text = model.category
        cell.releaseTimeLabel.text = String.init(format: "%.2ld' %.2ld''", Int(model.duration)! / 60, Int(model.duration)! % 60)
        return cell
    }
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let FSVC = FindSecondView()
        FSVC.index = CGFloat((indexPath as NSIndexPath).row)
        FSVC.dataArray = self.dataArray
        FSVC.imageArray = self.imageArray
        self.viewWillAppear(true)
        self.navigationController?.pushViewController(FSVC, animated: true)
    }
}
