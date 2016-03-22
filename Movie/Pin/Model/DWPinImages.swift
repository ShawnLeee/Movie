//
//  DWPinImages.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWPinImages: NSObject {
    var _345x:DWPinImage?
    var _750x:DWPinImage?
    convenience init(dict:NSDictionary?)
    {
        self.init()
        if let _dict = dict{
            if let x345dict = _dict[ImagesField.x345.rawValue] as? NSDictionary
            {
                self._345x = DWPinImage(dict: x345dict)
            }
            if let x750dict = _dict[ImagesField.x750.rawValue] as? NSDictionary
            {
                self._750x = DWPinImage(dict: x750dict)
            }
        }
        
    }
    private enum ImagesField:String
    {
        case x345 = "345x"
        case x750 = "750x"
    }
}
