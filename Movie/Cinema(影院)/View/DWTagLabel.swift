//
//  DWTagLabel.swift
//  Movie
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWTagLabel: UILabel {
    var tagModel:DWCinemaTag?
    init(tagModel:DWCinemaTag)
    {
        super.init(frame: CGRectZero)
        self.text = tagModel.name
        self.font = UIFont.systemFontOfSize(12)
        self.textAlignment = .Center
        self.tagModel = tagModel
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup(){
        self.layer.cornerRadius = 2.0
        self.layer.borderColor = tagModel?.tagType?.tagColor().CGColor
        self.textColor = tagModel?.tagType?.tagColor()
        self.layer.borderWidth = 1.0
    }
    

}
