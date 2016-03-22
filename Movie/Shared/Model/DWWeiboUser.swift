//
//  DWWeiboUser.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//
import ObjectMapper
import UIKit

class DWWeiboUser: Mappable {
    var id:Int?
    var name:String?
    var avatar_large:String?
    var urank:Int?
    required init?(_ map: Map) {
        
    }
    func mapping(map: Map) {
        id <- map[JSONField.id.rawValue]
        name <- map[JSONField.name.rawValue]
        avatar_large <- map[JSONField.avatar_large.rawValue]
        urank <- map[JSONField.urank.rawValue]
    }
    private enum JSONField:String
    {
        case id,name,avatar_large,urank
    }
}
