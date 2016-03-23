//
//  DWPhotoContainerView.swift
//  Movie
//
//  Created by Daniel on 16/3/23.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWPhotoContainerView: UIView {
    var imageViews = [UIImageView]()
    var dwScrollView:DWScrollView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self._setupSelf()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self._setupSelf()
    }
    private func _setupSelf()
    {
    }
    
    var card:DWCard! {
        didSet{
            let images = card.picItems?.map({
                ($0.pic)!
            })
            let width = UIScreen.mainScreen().bounds.size.width
            dwScrollView = DWScrollView(frame: CGRect(x: 0, y: 0, width: width, height: 100), withNetImages: images!)
//            self.addConstraint(dwScrollView.leftAnchor.constraintEqualToAnchor(self.leftAnchor))
//            self.addConstraint(dwScrollView.rightAnchor.constraintEqualToAnchor(self.rightAnchor))
//            self.addConstraint(dwScrollView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor))
//            self.addConstraint(dwScrollView.topAnchor.constraintEqualToAnchor(self.topAnchor))
            self.addSubview(dwScrollView)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
