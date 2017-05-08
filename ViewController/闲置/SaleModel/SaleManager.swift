//
//  SaleManager.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/21.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import Foundation

extension SaleModel {
    
    class func requestSaleData(_ maxnum:NSInteger,callBack:@escaping (_ saleArray:[AnyObject]?,_ error:NSError?) -> Void){
            //maxnum=0&status=0&type_id=14
        let para = ["maxnum":String(maxnum),"status":"0","type_id":"0"]
        BaseRequest.postWithURL(SALE_URL, para: para as NSDictionary?) { (data, error) in
            if error == nil {
                let obj = try!JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                let dict = obj["data"] as! [AnyObject]
                let dictArr = SaleModel.arrayOfModels(fromDictionaries: dict)
                DispatchQueue.main.async(execute: { 
                    callBack(dictArr! as [AnyObject], nil)
                })
            } else {
                callBack(nil, error)
            }
        }
    }
}

extension MessageModel {
    class func  requestMessageData(_ callBack:@escaping (_ messageArray:String?,_ error:NSError?)->Void){
        BaseRequest.getWithURL("http://223.6.252.2:8080//index.php/home/usedgood/getUsedgood_notify", para: nil) { (data, error) in
            if error == nil {
                let obj = try!JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                let message = obj["data"] as! String
                DispatchQueue.main.async(execute: {
                    callBack(message, nil)
                })
            } else {
                DispatchQueue.main.async(execute: { 
                    callBack(nil,error)
                })
            }
        }
    }
}

