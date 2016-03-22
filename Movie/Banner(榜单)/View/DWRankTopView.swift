//
//  DWRankTopView.swift
//  Movie
//
//  Created by Daniel on 16/3/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWRankTopView: UIView {
    @IBOutlet weak var topImageView:UIImageView!
    @IBOutlet weak var requiteBtn:UIButton!
    @IBOutlet weak var toolBar:UIView!
    var pagerankViewModel:DWRankPageViewModel! {
        didSet{
            self.topImageView.af_setImageWithURL(pagerankViewModel.backgroupURL!)
        }
    }
}
