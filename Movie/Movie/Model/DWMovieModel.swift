//
//  DWMovieModel.swift
//  Movie
//
//  Created by Daniel on 16/3/12.
//  Copyright © 2016年 Daniel. All rights reserved.
//
import Foundation
public class DWMovieModel:NSObject{
    var poster_url:String?
    var preview_url:String?
    var name:String?
    var genre:String?
    var publish_type:String?
    var button_type:String?
    var score:String?
    var film_id:Int?
    var button:DWMovieBtnModel?
    var actorsString:String?
    var wanttosee:Int?
    var hot_score:String?
    var topic_hot_count: String?
    var share_text:String?
    var rank:Int?
    var actors = [DWActor]()
    public init(json:NSDictionary)
    {
        super.init()
        parseJSON(json)
    }
}
internal enum JSONField:String
{
    case poster_url = "poster_url"
    case preview_url = "preview_url"
    case name = "name"
    case genre = "genre"
    case actors = "actors"
    case publish_type = "publish_type"
    case button_type = "button_type"
    case score = "score"
    case film_id = "film_id"
    case button = "button"
    case wanttosee = "wanttosee"
    case hot_score = "hot_score"
    case topic_hot_count = "topic_hot_count"
    case share_text = "share_text"
    case rank = "rank"
    
}
//MARK: - JSON
extension DWMovieModel{
    internal func parseJSON(json:NSDictionary) {
        self.poster_url = json[JSONField.poster_url.rawValue] as? String
        self.preview_url = json[JSONField.preview_url.rawValue] as? String
        self.name = json[JSONField.name.rawValue] as? String
        self.genre = json[JSONField.genre.rawValue] as? String
        self.publish_type = json[JSONField.publish_type.rawValue] as? String
        self.button_type = json[JSONField.button_type.rawValue] as? String
        self.score = json[JSONField.score.rawValue] as? String
        self.film_id = json[JSONField.film_id.rawValue] as? Int
        self.wanttosee = json[JSONField.wanttosee.rawValue] as? Int
        self.hot_score = json[JSONField.hot_score.rawValue] as? String
        self.topic_hot_count = json[JSONField.topic_hot_count.rawValue] as? String
        self.share_text = json[JSONField.share_text.rawValue] as? String
        self.rank = json[JSONField.rank.rawValue] as? Int
        if let actors = json["actors"] as? NSArray
        {
            self.actors = actors.map({
                DWActor(dict: $0 as! NSDictionary)
            })
        }
        var tmpString = ""
        for actor in self.actors{
           tmpString += "\(actor.name!) / "
        }
        self.actorsString = tmpString
        if let bDict = json[JSONField.button.rawValue] as? NSDictionary
        {
            self.button = DWMovieBtnModel(dict:bDict)
        }
    }
}

