//
//  DWCinemaViewModel.swift
//  Movie
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit
class DWCinemaTag:NSObject
{
    var name:String?
    var tagType:DWTagType?
    init(dict:NSDictionary)
    {
        self.name = dict["name"] as? String
        if let _typeInt = dict["type"] as? Int
        {
            self.tagType = DWTagType(rawValue:_typeInt)
        }
        super.init()
    }
    
}

class DWCinemaViewModel: NSObject {
    var cinemaName:String?
    var address:String?
    var distance:String?
    var lowPrice:String?
    var tags = [DWCinemaTag]()
    init(cinemaModel:DWCinemaModel)
    {
        self.cinemaName = cinemaModel.cinema_name
        self.address = cinemaModel.address
        self.distance = cinemaModel.distance
        self.lowPrice = "￥"+cinemaModel.low_price!+"起"
        self.tags = cinemaModel.tag
        super.init()
    }
}
enum DWTagType:Int{
        case VastCinema = 1
        case Seat = 2
        case Special = 3
    func tagColor() -> UIColor
    {
        switch self
        {
        case .Seat:
            return UIColor.seatColor()
        case .VastCinema:
            return UIColor.seatColor()
        case .Special:
            return UIColor.mainThemeColor()
        }
    }
}
