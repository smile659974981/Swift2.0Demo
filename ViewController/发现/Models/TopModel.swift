//
//  TopModel.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/17.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class TopModel: JSONModel {
    var detail:String!
    var title:String!
    var duration:String!
    var Description:String!
    var category:String!
    var feed:String!
    var forWeibo:String!
    var raw:String!
    var icon:String!
    var name:String!
    var Ddescription:String!
    var videoNum:String!
    var playUrl:String!
    var blurred:String!

    override class func keyMapper()->JSONKeyMapper{
        return JSONKeyMapper.init(modelToJSONDictionary: ["Description":"description"])
        //特殊处理某一个字段 ，模型中的属性 和字典中的 key 不一致时，设置赋值对应关系，模型中的属性名作为键,字典中的key 作为 value
    }
    override class func propertyIsOptional(_ propertyName:String)->Bool{
        return true
    }
}













