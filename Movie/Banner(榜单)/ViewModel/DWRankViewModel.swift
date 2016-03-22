//
//  DWRankViewModel.swift
//  Movie
//
//  Created by Daniel on 16/3/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWRankViewModel: NSObject {
    var rank:String?
    var movieImageURL:NSURL?
    var movieName:String?
    var actors:String?
    var topicHotCount:String?
    var hotScore:String?
    
    var movieModel:DWMovieModel!{
        didSet{
            self.rank = "\(movieModel.rank!)"
            self.movieImageURL = NSURL(string: movieModel.poster_url!)
            self.movieName = movieModel.name
            self.actors = actorStrWith(movieModel.actors)
            self.topicHotCount = movieModel.topic_hot_count
            self.hotScore = movieModel.hot_score
        }
    }
    private func actorStrWith(actors:[DWActor]) -> String
    {
        var tmpString = "主演:"
        for actor in actors{
           tmpString += "\(actor.name!) / "
        }
        return tmpString
    }
}

