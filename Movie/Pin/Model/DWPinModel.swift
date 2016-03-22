//
//  DWPinModel.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWPinModel: NSObject {
    var desc:String?
    var images : DWPinImages?
    var pinner : DWPinner?
    var board : DWBoard?
    convenience init(dict:NSDictionary)
    {
        self.init()
        if let _images = dict[PinJSONField.images.rawValue] as? NSDictionary
        {
            self.images = DWPinImages(dict: _images)
        }
        self.desc = dict[PinJSONField.description.rawValue] as? String
        if let _pinnerDict = dict[PinJSONField.pinner.rawValue] as? NSDictionary
        {
            self.pinner = DWPinner(dict:_pinnerDict)
        }
        if let _boardDict = dict[PinJSONField.board.rawValue] as? NSDictionary
        {
            self.board = DWBoard(dict: _boardDict)
        }
    }
    private enum PinJSONField:String
    {
        case images,description,pinner,board
    }
}
