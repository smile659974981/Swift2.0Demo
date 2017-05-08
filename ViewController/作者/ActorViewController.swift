//
//  ActorViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/4/21.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class ActorViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var start = 0
    var dataArray = NSMutableArray()
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 64 , width: SCREEN_W, height: SCREEN_H - 49 - 64))
        tableView.register(UINib.init(nibName: "ActorCell", bundle: nil), forCellReuseIdentifier: "ActorCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.start = 0
            self.loatData()
        })
        tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            self.start += 10
            self.loatData()
        })
        self.view.addSubview(tableView)
        return tableView
    }()
    override func viewDidLoad() {
        self.automaticallyAdjustsScrollViewInsets = false
        //200-60
        let viewImageView = UIImageView.init(frame: CGRect(x: (SCREEN_W - 100) / 2, y: 4, width: 100, height: 30))
        let viewImage = UIImage.init(named: "200-60")
        viewImageView.image = viewImage
        self.navigationItem.titleView = viewImageView
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.loatData()
    }
    func loatData() -> Void {
        ActorModel.requestActorData(self.start) { (actorArray, error) in
                self.dataArray.addObjects(from: actorArray!)
                self.tableView.reloadData()
                self.tableView.mj_header.endRefreshing()
                self.tableView.mj_footer.endRefreshing()
        }
    }
}

extension ActorViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  let arr = self.dataArray[section] as! [AnyObject]
        return dataArray.count
    }
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell", for: indexPath) as! ActorCell
       // let sectionArray = self.dataArray[indexPath.section] as! [ActorModel]
        let model = dataArray[(indexPath as NSIndexPath).row] as! ActorModel
        cell.iconView.sd_setImage(with: URL.init(string: model.icon))
        cell.titleLabel.text = model.title
        cell.descriptionLabel.text = model.Description
        cell.subTitlelabel.text = model.subTitle
        return cell
    }
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = dataArray[(indexPath as NSIndexPath).row] as! ActorModel
        let AutherVC = AutherViewController()
        AutherVC.pgcId = model.id
        AutherVC.nameLabel.text = model.title
        AutherVC.btn.sd_setImage(with: URL.init(string: model.icon), for: UIControlState())
        AutherVC.descriptionLabel.text = model.Description
        self.viewWillAppear(true)
        self.navigationController?.pushViewController(AutherVC, animated: true)
    }
}




