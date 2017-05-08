//
//  FindViewController.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/23.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class FindViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    lazy var contentView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        let contentView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: SCREEN_H - 49), collectionViewLayout: layout)
        contentView.contentOffset = CGPoint(x: 0, y: SCREEN_H)
        contentView.delegate = self
        contentView.dataSource = self
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        contentView.backgroundColor = UIColor.white
        contentView.showsVerticalScrollIndicator = false
        contentView.register(UINib.init(nibName: "FindCell", bundle: nil), forCellWithReuseIdentifier: "FindCell")
        contentView.register(FindReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "FindReusableView")
        self.view.addSubview(contentView)
        return contentView
    }()
    // 轮播:  头视图一:
    lazy var adView:XTADScrollView = {
        let adView = XTADScrollView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: 228))
        adView.infiniteLoop = true
        adView.needPageControl = false
        return adView
    }()
    // 头视图二: 
    lazy var adView1:XTADScrollView = {
        let adView1 = XTADScrollView.init(frame: CGRect(x: 0, y: 2, width: SCREEN_W, height: 226))
        adView1.infiniteLoop = true
        adView1.needPageControl = false
        return adView1
    }()
        var dataArray = NSMutableArray()
        var categoryId = String()
        override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        super.viewDidLoad()
        self.navigationColor()
        self.loadBannerData()
        self.automaticallyAdjustsScrollViewInsets = false
        self.contentView.contentSize = CGSize(width: 0, height: 0)

    }
    func navigationColor(){
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    func loadBannerData()->Void{
        DataModel.requestFindBannerData { (cellArray, firstArray, bannerArray, error) in
            if error == nil {
                self.dataArray.addObjects(from: [firstArray!,bannerArray!])
                self.adView1.imageURLArray = cellArray
                self.contentView.reloadData()
            } else {
                print("出错")
            }
        }
      ItemListModel.requestFindItemData { (imageArray, itemIlstArr, error) in
        if error == nil {
            self.adView.imageURLArray = imageArray
            self.contentView.reloadData()
        } else {
            print("出错")
            }
        }
    }
}

extension FindViewController {
    @objc(numberOfSectionsInCollectionView:) func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataArray.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let array = self.dataArray[section] as! [AnyObject]
        return array.count
    }
    @objc(collectionView:cellForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FindCell", for: indexPath) as! FindCell
        let sectionArray = self.dataArray[(indexPath as NSIndexPath).section] as! [DataModel]
        let model = sectionArray[(indexPath as NSIndexPath).row]
        cell.imageView.sd_setImage(with: URL.init(string: model.image))
        cell.titleLabel.text = model.title
        return cell
    }
    @objc(collectionView:layout:sizeForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREEN_W / 2 - 1, height: SCREEN_W / 2 - 1)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: SCREEN_W, height: 230)
    }
    @objc(collectionView:viewForSupplementaryElementOfKind:atIndexPath:) func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "FindReusableView", for: indexPath) as! FindReusableView
        if (indexPath as NSIndexPath).section == 0 {
            header.headerView.addSubview(adView)
        } else if (indexPath as NSIndexPath).section == 1 {
            header.headerView.addSubview(adView1)
        }
        return header
    }
    @objc(collectionView:didSelectItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath as NSIndexPath).section == 0{
        if (indexPath as NSIndexPath).item == 0{
            let TopVC = TopViewController()
            self.viewWillAppear(true)
            self.navigationController?.pushViewController(TopVC, animated: true)
        }else if (indexPath as NSIndexPath).row == 1{
            self.viewWillAppear(true)
            let TopicVC = TopicViewController()
            self.navigationController?.pushViewController(TopicVC, animated: true)
        }
        } else if (indexPath as NSIndexPath).section == 1{
        let contentVC = ContentViewController()
         self.viewWillAppear(true)
        self.navigationController?.pushViewController(contentVC, animated: true)
        let sectionArray = self.dataArray[(indexPath as NSIndexPath).section] as! [DataModel]
        let model = sectionArray[(indexPath as NSIndexPath).row]
        contentVC.navigationItem.title = model.title
        contentVC.contentCategoryId = model.id
        }
    }
}












