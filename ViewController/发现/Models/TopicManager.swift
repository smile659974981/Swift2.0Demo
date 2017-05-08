//
//  TopicManager.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/17.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import Foundation
extension TopicModel{
    class func requestTopicModelData(_ start:NSInteger, callBack:@escaping (_ dataArray:[AnyObject]?,_ error:NSError?)->Void){
        let URL = "http://baobab.wandoujia.com/api/v3/specialTopics"
        let para = ["start":String(start),"num":"20"]
        BaseRequest.getWithURL(URL, para: para as NSDictionary?) { (data, error) in
            if error == nil {
                let obj = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                var dataArr = [AnyObject]()
                let itemList = obj["itemList"] as! [AnyObject]
                for i in itemList{
                    let data = i["data"] as! NSDictionary
                    dataArr.append(data)
                }
                let dataArray = TopicModel.arrayOfModels(fromDictionaries: dataArr)
                DispatchQueue.main.async(execute: { 
                    callBack(dataArray as [AnyObject]? ,nil)
                })
            }else{
                    callBack(nil,error)
            }
        }
    }
}

















