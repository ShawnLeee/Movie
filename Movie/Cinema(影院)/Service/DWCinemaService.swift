//
//  DWCinemaService.swift
//  Movie
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWCinemaService: NSObject {
    class func cinemaModels() -> [DWCinemaModel]
    {
        let cinemaDict = NSDictionary.dictionaryWithLocalJSONFile("cinema.json")
        if let _cinemaDict = cinemaDict
        {
            if let cinemas = _cinemaDict["cinemas"] as? NSArray
            {
               return cinemas.map({
                    DWCinemaModel(dict: $0 as! NSDictionary)
                })
            }
        }
        return [DWCinemaModel]()
    }
    class func cinemaViewModels() -> [DWCinemaViewModel] {
        let cinemas = DWCinemaService.cinemaModels().map {
            DWCinemaViewModel(cinemaModel: $0)
        }
        return cinemas
    }
}
