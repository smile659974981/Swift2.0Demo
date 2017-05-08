//
//  TopicSecondManager.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/17.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import Foundation

extension TopicSecondModel{
    class func requestTopicSecondModelData(_ categoryId:String,callBack:@escaping (_ array:[AnyObject]?,_ imageArray:[AnyObject]?,_ error:NSError?)->Void){
        let URL = "http://baobab.wandoujia.com/api/v3/lightTopics/\(categoryId)"
        BaseRequest.getWithURL(URL, para: nil) { (data, error) in
            if error == nil {
                let obj = try!JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                let itemListArray = obj["itemList"] as! [AnyObject]
                var touchArray = [AnyObject]()
                var imageArray = [AnyObject]()
                for i in itemListArray {
                    let data = i["data"] as! NSDictionary
                    touchArray.append(data)
                    let a = data["cover"] as! NSDictionary
                    imageArray.append(a)
                }
                let touchArr = TouchModel.arrayOfModels(fromDictionaries: touchArray)
                let imageArr = TouchModel.arrayOfModels(fromDictionaries: imageArray)
                DispatchQueue.main.async(execute: {
                    callBack(touchArr as [AnyObject]?, imageArr as [AnyObject]?,nil)
                })
            }else{
                DispatchQueue.main.async(execute: {
                    callBack(nil, nil,error)
                })
            }
        }
    }
}




