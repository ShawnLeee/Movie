//
//  AvatarImageView.swift
//  Movie
//
//  Created by Daniel on 16/3/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class AvatarImageView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
         self.layer.cornerRadius = 10.0
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 3.0
    }

}
