//
//  ActorManager.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/26.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import Foundation

extension ActorModel {
    class func requestActorData(_ start:NSInteger,callBack:@escaping (_ actorArray:[AnyObject]?,_ error:NSError?)->Void) {
        let url = "http://baobab.wandoujia.com/api/v3/tabs/pgcs/more"
        let para = ["start":String(start), "num":"10"]
        BaseRequest.postWithURL(url, para: para as NSDictionary?) { (data, error) in
            if error == nil {
                let obj = try!JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                var actorArr = [AnyObject]()
                let actor = obj["itemList"] as! [AnyObject]
                for i in actor {
                    let type = i["type"] as! String
                    if type == "briefCard"{
                        let data = i["data"] as! NSDictionary
                        actorArr.append(data)
                    }
                }
                let actorArray = ActorModel.arrayOfModels(fromDictionaries: actorArr)
                callBack(actorArray as [AnyObject]?, nil)
            }else{
                callBack(nil, error)
            }
        }
    }
}


extension UpdataModel {
    class func requestUpdataData(_ callBack:@escaping (_ updataArray:[AnyObject]?, _ error:NSError?)->Void){
        let url = "http://baobab.wandoujia.com/api/v3/tabs/pgcs?_s=0dea53d5f315c222515256720884845a&f=iphone&net=wifi&u=843e5559476fa559a979a5ed6bee2a88e115cb27&v=2.6.0&vc=1209"
        BaseRequest.getWithURL(url, para: nil) { (data, error) in
            if error == nil {
                let obj = try!JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                let itemListArr = obj["itemList"] as! [AnyObject]
                var videoArr = [AnyObject]()
                for i in itemListArr {
                    let type = i["type"] as! String
                    if type == "videoCollectionWithBrief" {
                        let data = i["data"] as! NSDictionary
                        videoArr.append(data)
                       print(videoArr  )
                    }
                }
                let itemArrar = UpdataModel.arrayOfModels(fromDictionaries: videoArr)
                DispatchQueue.main.async(execute: {
                    callBack(itemArrar as [AnyObject]?, nil)
                })
            } else {
                callBack(nil, error)
            }
        }
    }
}










