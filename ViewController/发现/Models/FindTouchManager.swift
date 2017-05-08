//
//  FindTouchManager.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/10.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import Foundation
extension TouchModel {
    class func requestFindTouchData(_ start:NSInteger,categoryId:String,strategy:String, callBack:@escaping (_ array:[AnyObject]?,_ imageArray:[AnyObject]?, _ webArray:[AnyObject]?,_ error:NSError?)->Void){
        //http://baobab.wandoujia.com/api/v3/videos?_s=532b8d7a892bec8db14815121b544783&
       // start=10&num=10&categoryId=18&strategy=date

        //  ?_s=532b8d7a892bec8db14815121b544783&categoryId=18
         let para = ["start":String(start),"num":"10","categoryId":categoryId,"strategy":strategy]
       //let para = ["s":"532b8d7a892bec8db14815121b544783","categoryId":categoryId]
        BaseRequest.getWithURL(FIND_TPUCH_URL, para: para as NSDictionary?) { (data, error) in
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









