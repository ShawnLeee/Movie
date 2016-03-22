//
//  MovieDataManager.swift
//  Movie
//
//  Created by Daniel on 16/3/12.
//  Copyright © 2016年 Daniel. All rights reserved.
//
import UIKit
class MovieDataManager: NSObject {
   func movieDataWithFileName(fileName:String) -> [DWMovieModel]?
    {
        let dict = NSDictionary.dictionaryWithLocalJSONFile(fileName)
        let modelArr = movieModelsWithDict(dict!)
        return modelArr
    }
    private func movieModelsWithDict(dict:NSDictionary) -> [DWMovieModel]?
    {
        if let dictArr = dict["list"] as? NSArray
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


