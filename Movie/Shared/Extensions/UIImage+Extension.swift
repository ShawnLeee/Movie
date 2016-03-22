//
//  UIImage+Extension.swift
//  Movie
//
//  Created by Daniel on 16/3/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit
extension UIImage{
    static func imageWithColor(color:UIColor) -> UIImage
    {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
    }
}