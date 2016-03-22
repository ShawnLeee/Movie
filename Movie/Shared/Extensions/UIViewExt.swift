//
//  UIViewExt.swift
//  Movie
//
//  Created by Daniel on 16/3/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit
enum LoadNibError:ErrorType{
    case NotExist
}

extension UIView{
    /**
     Must have corresponding nib file with the same name
     
     - returns: the Instance of UIView or Subclass of UIView
     */
    class func loadViewFromNib<T:UIView>() throws -> T
    {
        guard let view = NSBundle.mainBundle().loadNibNamed(String(T), owner: nil, options: nil).last as? T else {
            throw LoadNibError.NotExist
        }
        return view
        
    }
}