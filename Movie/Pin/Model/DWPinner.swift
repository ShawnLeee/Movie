//
//  DWPinner.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWPinner: NSObject {
    var first_name:String?
    var image_medium_url:String?
    convenience init(dict:NSDictionary)
    {
        self.init()
        self.first_name = dict[PinnerField.first_name.rawValue] as? String
        self.image_medium_url = dict[PinnerField.image_medium_url.rawValue] as? String
    }
}
extension DWPinner
{
    enum PinnerField:String
    {
        case first_name,image_medium_url
    }
}
