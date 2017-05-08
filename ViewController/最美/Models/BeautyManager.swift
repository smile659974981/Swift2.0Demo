//
//  BeautyManager.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/21.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import Foundation
extension BeaytyModel {
    class func requestBeautyData(_ maxnum:NSInteger,callBack:@escaping (_ moveArray:[AnyObject]?,_ beautyHome:[AnyObject]?,_ error:NSError?) -> Void){
        let para = ["maxnum":String(maxnum)]
        BaseRequest.postWithURL(BEAUTY_URL, para: para as NSDictionary?) { (data, error) in
            if error == nil {
                let obj = try!JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                let dict = obj["data"] as! [AnyObject]
                var moveArray = [String]()
                for moveImage in dict {
                    let image = moveImage["pic"] as! String
                    moveArray.append(image)
                }
                let dicArr = BeaytyModel.arrayOfModels(fromDictionaries: dict)
                DispatchQueue.main.async(execute: { 
                    callBack(moveArray as [AnyObject]?,dicArr! as [AnyObject], nil)
                })
            } else {
                DispatchQueue.main.async(execute: { 
                    callBack(nil, nil, error)
                })
            }
        }
    }
}





