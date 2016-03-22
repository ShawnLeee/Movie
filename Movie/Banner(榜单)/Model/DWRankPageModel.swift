//
//  DWRankPageModel.swift
//  Movie
//
//  Created by Daniel on 16/3/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWRankPageModel: NSObject {
    var backgroup_url:String?
    var card_name:String?
    var date:String?
    var update_time:String?
    var list : [DWMovieModel]?
    var total:Int?
    var user_card:DWRankUserCard?
    init(dict:NSDictionary)
    {
        self.backgroup_url = dict[PageField.backgroup_url.rawValue] as? String
        self.card_name = dict[PageField.card_name.rawValue] as? String
        self.date = dict[PageField.date.rawValue] as? String
        self.update_time = dict[PageField.update_time.rawValue] as? String
        self.total = dict[PageField.total.rawValue] as? Int
        self.user_card = DWRankUserCard(dict: dict[PageField.user_card.rawValue] as? NSDictionary)
        self.list = DWRankPageModel.movieModelsWithDict(dict)
        super.init()
    }
    private static func movieModelsWithDict(dict:NSDictionary?) -> [DWMovieModel]?
    {
        if let dictArr = dict?["list"] as? NSArray
        {
            let modelArr = dictArr.map { (dict) -> DWMovieModel in
                let movieModel = DWMovieModel(json: dict as! NSDictionary)
                return movieModel
            }
            return modelArr
        }
        return nil
    }
}
private enum PageField:String
{
    case backgroup_url = "backgroup_url"
    case card_name = "card_name"
    case date = "date"
    case update_time = "update_time"
    case total = "total"
    case user_card = "user_card"
    case list = "list"
}
