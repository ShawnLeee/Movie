//
//  DWUserCardViewModel.swift
//  Movie
//
//  Created by Daniel on 16/3/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWUserCardViewModel: NSObject {
    var profileURL:NSURL?
    var name:String?
    var text:String?
    var fansCount:String?
    var isFollow:Bool?
    
    var userCard:DWRankUserCard!{
        didSet{
            self.profileURL = NSURL(string: userCard.profile_img_url!)
            self.text = userCard.text
            self.fansCount = "粉丝:\(userCard.fans_count)"
            self.isFollow = userCard.is_follow == 0 ? false : true
        }
    }
}
