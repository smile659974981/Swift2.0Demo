//
//  TopicViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/17.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class TopicViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var start = 0
    var dataArray = NSMutableArray()
    var count = CGFloat()
    var swipeView = UIView()
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: SCREEN_H))
        tableView.register(UINib.init(nibName: "TopicCell", bundle: nil), forCellReuseIdentifier: "TopicCell")
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.tabBarController?.tabBar.isHidden = true
        self.createViews()
        self.loadData()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    func createViews() -> Void {
        self.view.backgroundColor = UIColor.white
        let backBtnImage = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        let backItem = UIBarButtonItem.init(image: backBtnImage, style: .done, target: self, action:#selector(self.backBtnClick))
        self.navigationItem.leftBarButtonItem = backItem
    }
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    func loadData() -> Void {
        TopicModel.requestTopicModelData(self.start) { (dataArray, error) in
            self.dataArray.addObjects(from: dataArray!)
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
}

extension TopicViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        count = CGFloat(dataArray.count)
        return dataArray.count
    }
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicCell
        let model = dataArray[(indexPath as NSIndexPath).row] as! TopicModel
        cell.BigImage.sd_setImage(with: URL.init(string: model.image!))
        return cell
    }
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataArray[(indexPath as NSIndexPath).row] as! TopicModel
        let TopicSeVC = TopicSecondViewController()
        TopicSeVC.categoryId = model.id
        self.viewWillAppear(true)
        self.navigationController?.pushViewController(TopicSeVC, animated: true)
    }
}






