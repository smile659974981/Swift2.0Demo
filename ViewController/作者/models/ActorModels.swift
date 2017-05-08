//
//  ActorModels.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/26.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

/**作者模型**/
class ActorModel:JSONModel{
    var actionUrl: String!
     var Description: String!
     var icon: String!
     var id: String!
     var subTitle: String!
     var title: String!
    var dataType: String!
    var adTrack: String!
    
    override class func keyMapper()->JSONKeyMapper{
        
        return JSONKeyMapper.init(modelToJSONDictionary: ["Description":"description"])
        //特殊处理某一个字段 ，模型中的属性 和字典中的 key 不一致时，设置赋值对应关系，模型中的属性名作为键,字典中的key 作为 value
    }
    override class func propertyIsOptional(_ propertyName:String)->Bool{
        return true
    }
}

/**视频模型**/
class UpdataModel:JSONModel{
    var Description: String! /* 只要你身边有茶有奶，就能做出属于你的那一杯奶茶！
    今天，企鹅君教你四种超简单做法，代表春夏秋冬四种季节，从清新到香浓，从冰爽到暖心，花茶混搭，港式“撞”奶，就连做拿铁的奶泡都替你打好了~*/
     var title: String! // HOW TO| 一杯奶茶，从春到冬
    var category: String! // #开胃
    
    var playUrl:String! // http://baobab.wandoujia.com/api/v1/playUrl?vid=9722&editionType=default
    /*author*/
    var DDescription:String!// 你身边最懂吃喝的好朋友
    var icon: String! // http://img.kaiyanapp.com/c2e2a3647e1d62a7f383f9ab25d08f8d.jpeg
    var id: String! // 176
    var subTitle:String! // 21 个视频
    var name: String! // 企鹅吃喝指南
    var latestReleaseTime: String! // 1474886397000
    /*cover*/
    var detail: String! // http://img.kaiyanapp.com/3de444d97171054d0df51e42c7798756.jpeg?imageMogr2/quality/60
    /*webUrl*/
    var forWeibo: String! //http://wandou.im/31gu5i
    var raw: String! // http://www.wandoujia.com/eyepetizer/detail.html?vid=9722
    
    override class func propertyIsOptional(_ propertyName:String)->Bool{
        return true
    }
}
