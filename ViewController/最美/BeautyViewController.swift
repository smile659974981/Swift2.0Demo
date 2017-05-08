//
//  BeautyViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/4/21.
//  Copyright © 2016年 王志杰. All rights reserved.
//


import UIKit

class BeautyViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource {
    var dataArray = NSMutableArray()
    var maxnum = 0
    lazy var adView:XTADScrollView = {
        let adView = XTADScrollView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: 200))
        adView.infiniteLoop = true
        adView.needPageControl = false
        self.view.addSubview(adView)
        return adView
    }()
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 201 , width: SCREEN_W, height: SCREEN_H - 201))
        tableView.register(UINib.init(nibName: "BeatyCell", bundle: nil), forCellReuseIdentifier: "BeatyCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.maxnum = 0
            self.loadData()
        })
        tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            self.maxnum += 17
            self.loadData()
        })
        self.view.addSubview(tableView)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationColor()
        self.loadData()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    func navigationColor(){
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: 58))
        label.backgroundColor = UIColor.init(red: 246 / 256, green: 246 / 256, blue: 246 / 256, alpha: 0.9)
        //  label.backgroundColor = UIColor.init(red: 255 / 256, green: 255 / 256, blue: 255 / 256, alpha: 0.6)
        // 隐藏导航栏, 包括上面的按钮, 和透明度不一样
        // self.navigationController?.navigationBarHidden = true
        self.view.addSubview(label)
    }
    func loadData() -> Void {
        BeaytyModel.requestBeautyData(self.maxnum) { (moveArray, beautyHome, error) in
            if error == nil {
                    self.adView.imageURLArray = moveArray
                    self.dataArray.addObjects(from: beautyHome!)
                    self.tableView.reloadData()
                    self.tableView.mj_header.endRefreshing()
                    self.tableView.mj_footer.endRefreshing()
            }else{
            }
        }
    }
}
extension BeautyViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let array = self.dataArray[section] as! [AnyObject]
        return dataArray.count
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeatyCell", for: indexPath) as! BeatyCell
       // let sectionArray = self.dataArray[indexPath.section] as! [BeaytyModel]
        let model = dataArray[(indexPath as NSIndexPath).row] as! BeaytyModel
        cell.picView.sd_setImage(with: URL.init(string:model.pic ))
        cell.headView.sd_setImage(with: URL.init(string: model.headIcon))
        cell.nickNameLabel.text = model.nickname
        cell.titleLabel.text = model.showTitle
        return cell
    }
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mis = misViewController()
        self.navigationController?.pushViewController(mis, animated: true)
    }
}
