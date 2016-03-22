//
//  DWTagView.swift
//  Movie
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit
private let padding = 4
class DWTagView: UIView {
    private var tagLabels = [DWTagLabel]()
    var cinemaTags:[DWCinemaTag]!
        {
        didSet{
            addTagLabel()
        }
    }
    private func addTagLabel()
    {
        removeAllSubViews()
        for tagModel in cinemaTags
        {
            let tagLabel = DWTagLabel(tagModel: tagModel)
            
            tagLabels.append(tagLabel)
            self.addSubview(tagLabel)
        }
    }
    private func removeAllSubViews()
    {
        tagLabels.removeAll()
        for view in self.subviews
        {
            view.removeFromSuperview()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        for (index,tagLabel) in tagLabels.enumerate()
        {
            
            let text = tagLabel.text! as NSString
            let size = text.sizeForFont(tagLabel.font, maxH: bounds.height)
            let labelSize = CGSizeMake(size.width + 4, size.height + 4)
            var origin = CGPoint(x: 4, y: 0)
            
            if index > 0
            {
                let preLabel = tagLabels[index - 1]
                let labelX = CGRectGetMaxX(preLabel.frame) + 4
                origin = CGPoint(x: labelX, y: 0)
            }
            tagLabel.frame = CGRect(origin: origin, size: labelSize)
        }
    }
}
