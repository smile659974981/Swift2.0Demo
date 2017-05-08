//
//  TopicSecondViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/4/21.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class TopicSecondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var categoryId = ""
    var imageArray = NSMutableArray()
    var dataArray = NSMutableArray()
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: SCREEN_H))
        tableView.register(UINib.init(nibName: "TopicSecondCell", bundle: nil), forCellReuseIdentifier: "TopicSecondCell")
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
        self.view.backgroundColor = UIColor.white
        let backBtnImage = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        let backItem = UIBarButtonItem.init(image: backBtnImage, style: .done, target: self, action:#selector(self.backBtnClick))
        self.navigationItem.leftBarButtonItem = backItem
    }
    func loadData() -> Void {
        TopicSecondModel.requestTopicSecondModelData(self.categoryId) { (array, imageArray, error) in
            self.dataArray.addObjects(from: array!)
            self.imageArray.addObjects(from: imageArray!)
            self.tableView.reloadData()
            let swipeVIew = UIView.init(frame: CGRect(x: 0, y: 64, width: 10, height: SCREEN_H - 64))
            swipeVIew.backgroundColor = UIColor.clear
            self.view.addSubview(swipeVIew)
            let rightSwipe = UISwipeGestureRecognizer.init(target: self, action: #selector(self.backBtnClick))
            swipeVIew.addGestureRecognizer(rightSwipe)
        }
    }
    func backBtnClick() -> Void {
        self.navigationController!.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
}

extension TopicSecondViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicSecondCell", for: indexPath) as! TopicSecondCell
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

