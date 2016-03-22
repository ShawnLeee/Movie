//
//  DWWeiboModel.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//
import ObjectMapper
import UIKit

class DWWeiboModel: Mappable {
    var created_at:String?
    var text : String?
    var source:String?
    var user:DWWeiboUser?
    var reposts_count:Int?
    var comments_count:Int?
    var attitudes_count:Int?
    var film_name:String?
    required init?(_ map: Map) {
        
    }
    func mapping(map: Map) {
     created_at      <- map[JSONField.created_at.rawValue]
     text            <- map[JSONField.text.rawValue]
     source          <- map[JSONField.source.rawValue]
     user            <- map[JSONField.user.rawValue]
     reposts_count   <- map[JSONField.reposts_count.rawValue]
     comments_count  <- map[JSONField.comments_count.rawValue]
     attitudes_count <- map[JSONField.attitudes_count.rawValue]
     film_name       <- map[JSONField.film_name.rawValue]
    }
    private enum JSONField:String
    {
        case created_at,text,source,user,reposts_count,comments_count,attitudes_count,film_name
    }
}
