//
//  DWRankService.swift
//  Movie
//
//  Created by Daniel on 16/3/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWRankService: NSObject {
    static func movieRankViewModels() -> [DWRankViewModel]
    {
        
       if let models = MovieDataManager().movieDataWithFileName("hotpoll.json"){
         return  models.map({ (movieModel) -> DWRankViewModel in
               let rankViewModel = DWRankViewModel()
               rankViewModel.movieModel = movieModel
               return rankViewModel
            })
        }
        return [DWRankViewModel]()
    }
    static func rankPageViewModel() throws  -> DWRankPageViewModel
    {
        guard let dict = NSDictionary.dictionaryWithLocalJSONFile("hotpoll.json") else {
            throw RankServiceError.FataError
        }
        let rankPageViewModel = DWRankPageViewModel()
        rankPageViewModel.rankPageModel = DWRankPageModel(dict: dict)
        return rankPageViewModel
    }
    
}
private enum RankServiceError:ErrorType
{
    case FataError
}