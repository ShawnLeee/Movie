//
//  DWCinemaModel.swift
//  Movie
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWCinemaModel: NSObject {
    var cinema_id:Int?
    var cinema_name:String?
    var address:String?
    var distance:String?
    var low_price:String?
    var tag = [DWCinemaTag]()
    init(dict:NSDictionary)
    {
        self.cinema_id = dict[CinemaJSONField.cinema_id.rawValue] as? Int
        self.cinema_name = dict[CinemaJSONField.cinema_name.rawValue] as? String
        self.address = dict[CinemaJSONField.address.rawValue] as? String
        self.distance = dict[CinemaJSONField.distance.rawValue] as? String
        self.low_price = dict[CinemaJSONField.low_price.rawValue] as? String
        self.tag = DWCinemaModel.tagWithArrayDict(dict[CinemaJSONField.tag.rawValue] as! [NSDictionary])
        super.init()
    }
    class func tagWithArrayDict(arrayDict:[NSDictionary]) -> [DWCinemaTag]
    {
        return  arrayDict.map {
            DWCinemaTag(dict: $0)
        }
    }
}

private enum CinemaJSONField:String
{
    case cinema_id = "cinema_id"
    case cinema_name = "cinema_name"
    case address = "address"
    case distance = "distance"
    case low_price = "low_price"
    case tag = "tag"
}
