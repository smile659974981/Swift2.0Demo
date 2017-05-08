//
//  TopicModel.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/17.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class TopicModel: JSONModel {
    var actionUrl:String!
    var id:String!
    var image:String!
    
    override class func propertyIsOptional(_ propertyName:String)->Bool{
        return true
    }
}





