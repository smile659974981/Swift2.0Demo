//
//  AutherViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/18.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class AutherViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    var start = 0
    var pgcId = String()
    var strategy = "date"
    let headrView = UIView()
    var imageView = UIImageView()
    let btn = UIButton()
    let lBtn = UIButton()
    let rBtn = UIButton()
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let aView = UIView()
    let bView = UIView()
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 64, width: SCREEN_W, height: SCREEN_H))
        tableView.register(UINib.init(nibName: "FindTouchCell", bundle: nil), forCellReuseIdentifier: "FindTouchCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.start = 0
            self.loadData()
        })
        tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            self.start += 20
            self.loadData()
        })
        self.view.addSubview(tableView)
        return tableView
    }()
    //
    var imageArray = NSMutableArray()
    var dataArray = NSMutableArray()
    var pgcInfoArrar = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.tabBarController?.tabBar.isHidden = true
        self.createViews()
        self.loadData()
        self.automaticallyAdjustsScrollViewInsets = false
        let swipeVIew = UIView.init(frame: CGRect(x: 0, y: 64, width: 10, height: SCREEN_H - 64))
        swipeVIew.backgroundColor = UIColor.clear
        self.view.addSubview(swipeVIew)
        let rightSwipe = UISwipeGestureRecognizer.init(target: self, action: #selector(self.backBtnClick))
        swipeVIew.addGestureRecognizer(rightSwipe)
    }
    func createViews() -> Void {
        headrView.frame = CGRect(x: 0, y: 0, width: SCREEN_W, height: (SCREEN_H / 2) - 70)
        headrView.backgroundColor = UIColor.white
        tableView.tableHeaderView = headrView
        imageView.frame = self.headrView.frame
        headrView.addSubview(imageView)
        let image = UIImage.init(named: "a1")
        imageView.image = image
        btn.frame = CGRect(x: SCREEN_W / 2 - 35, y: 10, width: 70, height: 70)
        btn.layer.cornerRadius = btn.frame.size.height / 2
        headrView.addSubview(btn)
        nameLabel.frame = CGRect(x: 20, y: btn.mj_h + btn.mj_y + 10, width: SCREEN_W - 40, height: 23)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        nameLabel.textAlignment = .center
        headrView.addSubview(nameLabel)
        descriptionLabel.frame = CGRect(x: 50, y: nameLabel.mj_h + nameLabel.mj_y + 10, width: SCREEN_W - 100, height: 80)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = UIColor.gray
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        headrView.addSubview(descriptionLabel)
        lBtn.frame = CGRect(x: (SCREEN_W - 140) / 3, y: descriptionLabel.mj_y + descriptionLabel.mj_h + 25, width: 70, height: 23)
        rBtn.frame =  CGRect(x: (SCREEN_W - 140) / 3 + 70 + (SCREEN_W - 140) / 3, y: descriptionLabel.mj_y + descriptionLabel.mj_h + 25, width: 70, height: 23)
        lBtn.setTitle("按时间排序", for: UIControlState())
        rBtn.setTitle("分享排行榜", for: UIControlState())
        lBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        rBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        lBtn.setTitleColor(UIColor.black, for: UIControlState())
        rBtn.setTitleColor(UIColor.black, for: UIControlState())
        lBtn.setTitleColor(UIColor.cyan, for: UIControlState())
        lBtn.tag = 1
        rBtn.tag = 2
        headrView.addSubview(lBtn)
        headrView.addSubview(rBtn)
        lBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)
        rBtn.addTarget(self, action: #selector(self.btnClick(_:)), for: .touchUpInside)

        //
        aView.frame = CGRect(x: lBtn.mj_x - 3, y: lBtn.mj_y - 1, width: lBtn.mj_w + 6, height: 1)
        aView.backgroundColor = UIColor.black
        bView.frame = CGRect(x: lBtn.mj_x - 3, y: lBtn.mj_y + lBtn.mj_h + 1, width: lBtn.mj_w + 6, height: 1)
        bView.backgroundColor = UIColor.black
        headrView.addSubview(aView)
        headrView.addSubview(bView)
        
        let backBtnImage = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        let backItem = UIBarButtonItem.init(image: backBtnImage, style: .done, target: self, action:#selector(self.backBtnClick))
        self.navigationItem.leftBarButtonItem = backItem
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
                self.loadData()
            default:
                self.aView.frame = CGRect(x: self.rBtn.mj_x - 3, y: self.rBtn.mj_y - 1, width: self.rBtn.mj_w + 6, height: 1)
                self.bView.frame = CGRect(x: self.rBtn.mj_x - 3, y: self.rBtn.mj_y + self.rBtn.mj_h + 1, width: self.rBtn.mj_w + 6, height: 1)
                self.rBtn.setTitleColor(UIColor.cyan, for: UIControlState())
                self.lBtn.setTitleColor(UIColor.black, for: UIControlState())
                self.strategy = "shareCount"
                self.dataArray.removeAllObjects()
                self.imageArray.removeAllObjects()
                self.loadData()
            }
        }) 
    }
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    func loadData() -> Void {
        AutherModel.requestAutherData(self.start, pgcId: self.pgcId, strategy: self.strategy) { (array, imageArray, pgcInfoArrar, error) in
            self.dataArray.addObjects(from: array!)
            self.imageArray.addObjects(from: imageArray!)
            self.pgcInfoArrar.add(pgcInfoArrar!)
            self.tableView.reloadData()
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
        }
    }
}

extension AutherViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FindTouchCell", for: indexPath) as! FindTouchCell
        let model = dataArray[(indexPath as NSIndexPath).row] as! TouchModel
        let model1 = imageArray[(indexPath as NSIndexPath).row] as! TouchModel
        cell.feedImageView.sd_setImage(with: URL.init(string: model1.feed))
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

