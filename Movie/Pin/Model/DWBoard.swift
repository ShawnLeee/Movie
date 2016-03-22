//
//  DWBoard.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWBoard: NSObject {
    var category:String?
    convenience init(dict:NSDictionary)
    {
        self.init()
        self.category = dict[BoardField.category.rawValue] as? String
    }
    
}
extension DWBoard{
    enum BoardField:String{
        case category
    }
}

