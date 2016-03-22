//
//  DWMovieBtnModel.swift
//  Movie
//
//  Created by Daniel on 16/3/14.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import Foundation
class DWMovieBtnModel:NSObject
{
    var buttonType:DWButtonType?
    var url:String?
    init(dict:NSDictionary)
    {
        url = dict["url"] as? String
        if let _title = dict["title"] as? String
        {
            buttonType = DWButtonType(rawValue:_title)
        }
    }
}