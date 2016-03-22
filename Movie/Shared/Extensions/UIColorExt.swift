//
//  UIColorExt.swift
//  Movie
//
//  Created by Daniel on 16/3/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit
public extension UIColor{
    public class func RGBColor(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor
    {
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    public class func buyButtonColor() -> UIColor
    {
        return UIColor.RGBColor(254, g: 213, b: 83)
    }
    public class func preBuyColor() -> UIColor
    {
        return UIColor.RGBColor(74, g: 157, b: 219)
    }
    public class func mainThemeColor() -> UIColor
    {
        return UIColor.buyButtonColor()
    }
    public class func seatColor() -> UIColor
    {
        return UIColor.RGBColor(130, g: 157, b: 189)
    }
}
