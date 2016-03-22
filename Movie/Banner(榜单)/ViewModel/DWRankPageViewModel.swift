//
//  DWRankPageViewModel.swift
//  Movie
//
//  Created by Daniel on 16/3/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWRankPageViewModel: NSObject {
    var backgroupURL:NSURL?
    var cardName:String?
    var movieList = [DWRankViewModel]()
    var userCard = DWUserCardViewModel()
    var rankPageModel:DWRankPageModel! {
        didSet {
            self.backgroupURL = NSURL(string: rankPageModel.backgroup_url!)
            self.cardName = rankPageModel.card_name
            if let movieModels = rankPageModel.list
            {
                self.movieList = movieModels.map{
                    let rankViewModel = DWRankViewModel()
                    rankViewModel.movieModel = $0
                    return rankViewModel
                }
            }
            self.userCard.userCard = rankPageModel.user_card
            
        }
    }
    
}
