//
//  String.swift
//  Movie
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import Foundation
import UIKit
extension NSString
{
     func sizeForFont(font:UIFont,maxH:CGFloat) -> CGSize {
        let maxSize = CGSize(width: CGFloat.max, height: maxH)
        let rect = self.boundingRectWithSize(maxSize, options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context: nil)
        return rect.size
    }
}