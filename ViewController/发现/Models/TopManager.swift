//
//  TopManager.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/17.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import Foundation

extension TopModel{
    class func requestTopModelData(_ strategy:String, callBack:@escaping ((_ array:[AnyObject]?,_ imageArray:[AnyObject]?, _ webArray:[AnyObject]?,_ error:NSError?)->Void)){
        let URL = "http://baobab.wandoujia.com/api/v3/ranklist"
        let para = ["strategy":strategy]
        BaseRequest.getWithURL(URL, para: para as NSDictionary?) { (data, error) in
            if error == nil {
                let obj = try!JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                let itemListArray = obj["itemList"] as! [AnyObject]
                var touchArray = [AnyObject]()
                var imageArray = [AnyObject]()
                var webArray = [AnyObject]()
                for i in itemListArray {
                    let data = i["data"] as! NSDictionary
                    touchArray.append(data)
                    let a = data["cover"] as! NSDictionary
                    imageArray.append(a)
                    let b = data["webUrl"] as! NSDictionary
                    webArray.append(b)
                }
                let touchArr = TouchModel.arrayOfModels(fromDictionaries: touchArray)
                let imageArr = TouchModel.arrayOfModels(fromDictionaries: imageArray)
                let webArr = TouchModel.arrayOfModels(fromDictionaries: webArray)
                DispatchQueue.main.async(execute: {
                    callBack(touchArr as [AnyObject]?, imageArr as [AnyObject]?, webArr as [AnyObject]?,nil)
                })
            }else{
                DispatchQueue.main.async(execute: {
                    callBack(nil, nil, nil,error)
                })
            }
        }
    }
}







