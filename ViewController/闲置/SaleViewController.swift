//
//  SaleViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/20.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class SaleViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var maxnum = 0
    var dataArray = NSMutableArray()
    lazy var contentView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        let contentView = UICollectionView.init(frame: CGRect(x: 3, y: 64 + 25, width: SCREEN_W - 6, height: SCREEN_H - 64 - 28), collectionViewLayout: layout)
        contentView.contentOffset = CGPoint(x: 0, y: SCREEN_H - 64)
        contentView.backgroundColor = UIColor.init(red: 207 / 256, green: 206 / 256, blue: 210 / 256, alpha: 1)
        contentView.delegate = self
        contentView.dataSource = self
        contentView.backgroundView = UIImageView.init(image: UIImage.init(named: "123"))
        contentView.showsVerticalScrollIndicator = false
        contentView.register(UINib.init(nibName: "SaleCell", bundle: nil), forCellWithReuseIdentifier: "SaleCell")
        contentView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.maxnum = 0
            self.loadData()
        })
        contentView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            self.maxnum += 18
            self.loadData()
        })

        self.view.addSubview(contentView)
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        self.automaticallyAdjustsScrollViewInsets = false
        }
    
    func loadData(){
            SaleModel.requestSaleData(self.maxnum) { (saleArray, error) in
                self.dataArray.addObjects(from: saleArray!)
                self.contentView.reloadData()
                self.contentView.mj_header.endRefreshing()
                self.contentView.mj_footer.endRefreshing()
        }
        MessageModel.requestMessageData { (messageArray, error) in
            let label = UILabel.init(frame: CGRect(x: 0, y: 64, width: SCREEN_W, height: 23))
            label.backgroundColor = UIColor.black
            let imageView = UIImageView.init(frame: CGRect(x: 20, y: 68, width: 14, height: 14))
            let image = UIImage.init(named: "icon-xz-tips")
            imageView.image = image
            label.text = messageArray
            label.textColor = UIColor.white
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.textAlignment = .center
            self.view.addSubview(label)
            self.view.addSubview(imageView)
        }
    }
}

extension SaleViewController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //let array = self.dataArray[section] as! [AnyObject]
        return dataArray.count
    }
    
    @objc(collectionView:cellForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = contentView.dequeueReusableCell(withReuseIdentifier: "SaleCell", for: indexPath) as! SaleCell
       // let sectionArray = self.dataArray[indexPath.section] as! [SaleModel]
        let model = dataArray[(indexPath as NSIndexPath).row] as! SaleModel
        cell.picView.sd_setImage(with: URL.init(string: model.pic))
        cell.nameLabel.text = model.name
        cell.priceLabel.text = "处理价：¥\(model.price)"
        return cell
    }
 
    @objc(collectionView:layout:sizeForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREEN_W / 2 - 4, height: 260)
    }
    @objc(collectionView:didSelectItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mis = misViewController()
        self.navigationController?.pushViewController(mis, animated: true)
    }
}
