//
//  FindTouchModel.swift
//  HotCar
//
//  Created by 孑孓 on 16/10/10.
//  Copyright © 2016年 王志杰. All rights reserved.
//

import UIKit

class TouchModel: JSONModel {
    // 一级
    var detail:String! //http://img.kaiyanapp.com/4297f692d7dcc9a9356aa4bacfe3fc92.jpeg?imageMogr2/quality/60
    var title:String! //课堂游戏玩成世界亚军，少年的极限转笔
    var duration:String! //1476012804000 时间
    // 二级
    var Description:String! // 课堂上打发时间玩的转笔，被他玩成了酷炫的手部极限运动！上百种姿势让你目不暇接，走哪儿转哪儿，带你感受转笔的最高境界！
    var category:String! //运动
    var feed:String! //http://img.kaiyanapp.com/4297f692d7dcc9a9356aa4bacfe3fc92.jpeg?imageMogr2/quality/60  图片
    var forWeibo:String!
    var raw:String!
    var icon:String! //http://img.kaiyanapp.com/9a6f655ef4d1f70e4e9b6f7e2076596a.jpeg?imageMogr2/quality/60
    var name:String! //敢玩
    var Ddescription:String! //你敢肆无忌惮地玩耍么？一起做个自由的野孩子吧！顽童、玩法、玩具，随你挑。关注公众号：敢玩
    var videoNum:String! // 6
    var playUrl:String!
    var blurred:String! //模糊背景图

    override class func keyMapper()->JSONKeyMapper{
        return JSONKeyMapper.init(modelToJSONDictionary: ["Description":"description"])
        //特殊处理某一个字段 ，模型中的属性 和字典中的 key 不一致时，设置赋值对应关系，模型中的属性名作为键,字典中的key 作为 value
    }
    override class func propertyIsOptional(_ propertyName:String)->Bool{
        return true
    }
}











