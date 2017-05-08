//
//  BaseRequest.swift
//  PoKitchen
//
//  Created by 孑孓 on 16/9/21.
//  Copyright © 2016年 王志杰. All rights reserved.import UIKit

class BaseRequest{
    
    class func getWithURL(_ url:String!,para:NSDictionary?,callBack:@escaping (_ data:Data?,_ error:NSError?)->Void)->Void
    {
     //   let session = URLSession.shared
        let urlStr = NSMutableString.init(string: url)
        if para != nil {
            urlStr.append(self.encodeUniCode(self.parasToString(para!) as NSString) as String)
        }
        let request = NSMutableURLRequest.init(url: (URL.init(string: urlStr as String))!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, respose, error) in
            if data != nil
            {
                callBack(data,nil)
            }else
            {
                callBack(nil,error as NSError?)
            }
        }
    //    let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
//            let res:NSHTTPURLResponse = response as! NSHTTPURLResponse
    //        if data != nil
    //        {
   //             callBack(data:data,error:nil)
  //          }else
  //          {
  //              callBack(data:nil,error:error)
   //         }
    //    })
        //启动请求任务
        task.resume()
    }
    
    class func postWithURL(_ url:String!,para:NSDictionary?,callBack:@escaping (_ data:Data?,_ error:NSError?)->Void)->Void{
      //  let session = URLSession.shared
        
        let urlStr = NSMutableString.init(string: url)
        if para != nil {
            urlStr.append(self.encodeUniCode(self.parasToString(para!) as NSString) as String)
        }
        let request = NSMutableURLRequest.init(url: (URL.init(string: urlStr as String))!)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, respose, error) in
            if data != nil
            {
                callBack(data,nil)
            }else
            {
                callBack(nil,error as NSError?)
            }
        }        //启动请求任务
        task .resume()
    }
    
    class func parasToString(_ para:NSDictionary?)->String
    {
        let paraStr = NSMutableString.init(string: "?")
        for (key,value) in para as! [String :String]
        {
            paraStr.appendFormat("%@=%@&", key,value)
        }
        if paraStr.hasSuffix("&"){
            paraStr.deleteCharacters(in: NSMakeRange(paraStr.length - 1, 1))
        }
        //将URL中的特殊字符进行转吗
       paraStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)
        //移除转码
     //   paraStr.removingPercentEncoding
        
        return String(paraStr)
    }
    
    class func encodeUniCode(_ string:NSString)->NSString
    {
        return string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)! as NSString
    }
///Users/qianfeng/Desktop/HotCar/common/BaseRequest.swift:21:24: Ambiguous reference to member 'dataTask(with:completionHandler:)'
}
