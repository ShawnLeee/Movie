//
//  DWPinImage.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWPinImage: NSObject {
    var url:String?
    var width:Int?
    var height:Int?
    override init()
    {
        super.init()
    }
    convenience init(dict:NSDictionary?)
    {
        self.init()
        if let _dict  = dict{
            self.url = _dict[ImageField.url.rawValue] as? String
            self.width = _dict[ImageField.width.rawValue] as? Int
            self.height = _dict[ImageField.height.rawValue] as? Int
        }
    }
    private enum ImageField:String
    {
       case  url,width,height
    }
}
