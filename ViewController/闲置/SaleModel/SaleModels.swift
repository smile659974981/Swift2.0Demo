//
//  SaleModels.swift
//  HotCar
//
//  Created by 孑孓 on 16/9/21.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class SaleModel:JSONModel{
    var pic:String!
    var name:String!
    var price:String!
    
    override class func propertyIsOptional(_ propertyName:String)->Bool{
        return true
    }
}

class MessageModel: JSONModel {
    var data:String!
    
    override class func propertyIsOptional(_ propertyName:String)->Bool{
        return true
    }
}









