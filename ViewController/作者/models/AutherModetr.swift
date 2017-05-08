//
//  AutherModetr.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/18.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class AutherModel: JSONModel {
    var detail:String!
    var title:String!
    var duration:String!
    var Ddescription:String!
    var category:String!
    var feed:String!
    var forWeibo:String!
    var raw:String!
    var Dddescription:String!
    var videoNum:String!
    var playUrl:String!
    var blurred:String!
    //
    var Description:String!
    var icon:String = ""
    var name:String!
    
    override class func propertyIsOptional(_ propertyName:String)->Bool{
        return true
    }
}




