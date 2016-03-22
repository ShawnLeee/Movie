//
//  DWPinCell.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWPinCell: UICollectionViewCell,CellResuable {
    @IBOutlet weak var pinImageView:UIImageView!
    @IBOutlet weak var descLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 4.0
    }
    var pinModel:DWPinModel!{
        didSet{
            self.pinImageView.af_setImageWithURL(NSURL(string: (pinModel.images?._345x?.url)!)!)
            self.descLabel.text = pinModel.desc
        }
    }
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
         super.applyLayoutAttributes(layoutAttributes)
//        if let attributes = layoutAttributes as? PinterestLayoutAttributes {
//            
//        }
    }
    

}
