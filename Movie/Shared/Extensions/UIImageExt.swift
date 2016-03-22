//
//  Ext.swift
//  Movie
//
//  Created by Daniel on 16/3/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

extension UIImage
{
    enum MovieImage:String{
        case common_feed_arrow
    }
    convenience init?(mImge movieImage:MovieImage)
    {
        self.init(named:movieImage.rawValue)
    }
}