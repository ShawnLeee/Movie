//
//  DWPinService.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit
class PageModel:NSObject
{
    var status:String?
    var code:Int?
    var bookmark:String?
    var host:String?
    var generated_at:String?
    var message:String?
    var data = [DWPinModel]()
    convenience init(dict:NSDictionary)
    {
        self.init()
        self.status = dict[PageJSONField.status.rawValue] as? String
        self.code = dict[PageJSONField.code.rawValue] as? Int
        self.bookmark = dict[PageJSONField.bookmark.rawValue] as? String
        self.host = dict[PageJSONField.host.rawValue] as? String
        self.message  = dict[PageJSONField.message.rawValue] as? String
        if let _pinDataArray = dict[PageJSONField.data.rawValue] as? NSArray{
            self.data = _pinDataArray.map({
                DWPinModel(dict: $0 as! NSDictionary )
            })
        }
    }
    private enum PageJSONField:String
    {
        case status,code,bookmark,host,generated_at,message,data
    }
}
class DWPinService: NSObject {
    class func pageModel() -> PageModel
    {
        if let dict = pinDictWithJSONFile("pin.json"){
            let pageModel = PageModel(dict: dict)
            return pageModel
        }
        else
        {
            return PageModel()
        }
    }
    static  func pinDictWithJSONFile(fileName:String) -> NSDictionary?
    {
        let filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: nil)
        if let filePath = filePath
        {
            let data = NSData(contentsOfFile: filePath)
            guard let jdata = data else{ return nil }
            do
            {
                
                if let dict = try NSJSONSerialization.JSONObjectWithData(jdata, options:.AllowFragments) as? NSDictionary {
                    return dict
                }
            }catch{
                return nil
            }
            
        }
        return nil
    }
}