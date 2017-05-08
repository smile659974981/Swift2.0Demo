//
//  AutherManager.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/18.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import Foundation

extension AutherModel{
    class func requestAutherData(_ start:NSInteger,pgcId:String,strategy:String, callBack: @escaping (_ array:[AnyObject]?,_ imageArray:[AnyObject]?, _ pgcInfoArrar:[AnyObject]?,_ error:NSError?)->Void){
        //htp://baobab.wandoujia.com/api/v3/pgc/videos?num=20&pgcId=82&start=0&strategy=date
        let URL = "http://baobab.wandoujia.com/api/v3/pgc/videos"
        //num=20&pgcId=82&start=0&strategy=date
        let para = ["num":"20","start":String(start),"pgcId":pgcId,"strategy":strategy]
        BaseRequest.getWithURL(URL, para: para as NSDictionary?) { (data, error) in
                if error == nil {
                    let obj = try!JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    let itemListArray = obj["itemList"] as! [AnyObject]
                    var touchArray = [AnyObject]()
                    var imageArray = [AnyObject]()
                    var pgcInfoArray = [AnyObject]()
                    for i in itemListArray {
                        let data = i["data"] as! NSDictionary
                        touchArray.append(data)
                        let a = data["cover"] as! NSDictionary
                        imageArray.append(a)
                    }
                    let pgcInfoDic = obj["pgcInfo"] as! NSDictionary
                    pgcInfoArray.append(pgcInfoDic)
                    let touchArr = TouchModel.arrayOfModels(fromDictionaries: touchArray)
                    let imageArr = TouchModel.arrayOfModels(fromDictionaries: imageArray)
                    let pgcInfoArr = TouchModel.arrayOfModels(fromDictionaries: pgcInfoArray)
                    DispatchQueue.main.async(execute: {
 //                       callBack(array: touchArr as [AnyObject], imageArray: imageArr as [AnyObject], pgcInfoArrar:pgcInfoArr as [AnyObject],error: nil)
                        callBack(touchArr as [AnyObject]?, imageArr as [AnyObject]?, pgcInfoArr as [AnyObject]?, nil)
                    })
                }else{
                    DispatchQueue.main.async(execute: {
                      //  callBack(array: nil, imageArray: nil, pgcInfoArrar: nil,error: error)
                        callBack(nil, nil, nil, error)
                })
            }
        }
    }
}


