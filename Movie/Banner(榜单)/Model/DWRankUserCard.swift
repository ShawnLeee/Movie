//
//  DWRankUserCard.swift
//  Movie
//
//  Created by Daniel on 16/3/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWRankUserCard: NSObject {
    var sinaid:Int?
    var profile_img_url:String?
    var text:String?
    var fans_count:Int?
    var is_follow:Int?
    init(dict:NSDictionary?)
    {
        if let dict = dict
        {
            self.sinaid = dict[CardField.sinaid.rawValue] as? Int
            self.profile_img_url = dict[CardField.profile_img_url.rawValue] as? String
            self.text = dict[CardField.text.rawValue] as? String
            self.fans_count = dict[CardField.fans_count.rawValue] as? Int
            self.is_follow = dict[CardField.is_follow.rawValue] as? Int    
        }
        
        super.init()
    }
}
private enum CardField:String{
    case sinaid="sinaid"
    case profile_img_url="profile_img_url"
    case text="text"
    case fans_count="fans_count"
    case is_follow="is_follow"
}
