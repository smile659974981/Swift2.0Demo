//
//  BeautyModel.swift
//  HotCar
//  Created by 孑孓 on 16/9/21.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class BeaytyModel:JSONModel{
    var headIcon:String!
    var nickname:String!
    var pic:String!
    var showTitle:String!
    
    override class func keyMapper()->JSONKeyMapper{
        return JSONKeyMapper.fromUnderscoreCaseToCamelCase()
    }
    override class func propertyIsOptional(_ propertyName:String)->Bool{
        return true
    }
}


