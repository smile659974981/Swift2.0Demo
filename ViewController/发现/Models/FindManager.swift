//
//  FindManager.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/23.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import Foundation

extension DataModel {
    class func requestFindBannerData(_ callBack:@escaping (_ cellArray:[AnyObject]?,_ firstArray:[AnyObject]?,_ bannerArray:[AnyObject]?,_ error:NSError?)->Void){
        let url = "http://baobab.wandoujia.com/api/v3/discovery?_s=f5b9d52f32b1afa3c1c09a536c8effa4&f=iphone&net=wifi&u=843e5559476fa559a979a5ed6bee2a88e115cb27&v=2.6.0&vc=1209"
        BaseRequest.getWithURL(url, para: nil) { (data, error) in
            if error == nil {
            let obj = try!JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                let itemList = obj["itemList"] as! [AnyObject]
                var firstArrr = [AnyObject]()
                var babaArr = [AnyObject]()
                var cellArr = [String]()
                for i in itemList {
                    let type = i["type"] as! String
                    if type as String == "squareCard"{
                    let data = i["data"] as! NSDictionary
                    babaArr.append(data)
                    } else if type as String == "rectangleCard" {
                        let data = i["data"] as! NSDictionary
                        let image = data.object(forKey: "image") as! String
                        cellArr.append(image)
                    }
                }
                for _ in babaArr {
                    let a = babaArr[0] as! NSDictionary
                    let b = babaArr[1] as! NSDictionary
                    firstArrr.append(a)
                    firstArrr.append(b)
                    break
                }
                for _ in babaArr {
                    babaArr.remove(at: 0)
                    break
                }
                for _ in babaArr {
                    babaArr.remove(at: 0)
                    break
                }
                let firstArr = DataModel.arrayOfModels(fromDictionaries: firstArrr)
                let itemListArr = DataModel.arrayOfModels(fromDictionaries: babaArr)
                DispatchQueue.main.sync(execute: {
                    callBack(cellArr as [AnyObject],firstArr! as [AnyObject],itemListArr! as [AnyObject], nil)
                })
            }else{
                DispatchQueue.main.sync(execute: { 
                    callBack(nil,nil,nil, error)
                })
            }
        }
    }
}

extension ItemListModel {
    class func requestFindItemData(_ callback:@escaping (_ imageArray:[AnyObject]?,_ itemIlstArr:[AnyObject]?, _ error:NSError?)->Void){
        let url = "http://baobab.wandoujia.com/api/v3/discovery?_s=f5b9d52f32b1afa3c1c09a536c8effa4&f=iphone&net=wifi&u=843e5559476fa559a979a5ed6bee2a88e115cb27&v=2.6.0&vc=1209"
        BaseRequest.getWithURL(url, para: nil) { (data, error) in
            if error == nil {
                let obj = try!JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                let itemList = obj["itemList"] as! NSArray
                var bannerArr = [AnyObject]()
                var imageArr = [String]()
                for _ in itemList {
                    let bannerDic = itemList[0] as! NSDictionary
                    let data = bannerDic.object(forKey: "data") as! NSDictionary
                    let a = data.object(forKey: "itemList") as! [AnyObject]
                    for i in a {
                        let data = i["data"] as! NSDictionary
                        let image = data.object(forKey: "image") as! String
                        imageArr.append(image)
                        bannerArr.append(data)
                    }
                    break
                }
                let bannerArray = ItemListModel.arrayOfModels(fromDictionaries: bannerArr)
                DispatchQueue.main.sync(execute: {
                   // callback(imageArr as [AnyObject]?,bannerArray as [AnyObject], nil)
                    callback(imageArr as [AnyObject]?, bannerArray  as [AnyObject]?, nil)
                })
            } else {
                DispatchQueue.main.sync(execute: {
                    callback(nil,nil, error)
                })
            }
        }
    }
}






