//
//  FindModel.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/23.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class DataModel:JSONModel{
    var actionUrl:String!
    var image:String!
    var id:String!
    var title:String!
    var type:String!
    
    override class func keyMapper()->JSONKeyMapper{
        return JSONKeyMapper.fromUnderscoreCaseToCamelCase()
    }
    override class func propertyIsOptional(_ propertyName:String)->Bool{
        return true
    }
}


class ItemListModel: JSONModel {
    var actionUrl:String!
    var id:String!
    var image:String!
    override class func keyMapper()->JSONKeyMapper{
        return JSONKeyMapper.fromUnderscoreCaseToCamelCase()
    }
    override class func propertyIsOptional(_ propertyName:String)->Bool{
        return true
    }
}




