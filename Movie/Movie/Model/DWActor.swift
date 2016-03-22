//
//  DWActor.swift
//  Movie
//
//  Created by Daniel on 16/3/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWActor: NSObject {
    var name:String?
    var sinaid:Int?
    var artist_id:Int?
    init(dict:NSDictionary)
    {
        self.name = dict["name"] as? String
        self.sinaid = dict["sinaid"] as? Int
        self.artist_id = dict["artist_id"] as? Int
    }
}
