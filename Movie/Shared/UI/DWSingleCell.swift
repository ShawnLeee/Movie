//
//  DWSingleCell.swift
//  Movie
//
//  Created by Daniel on 16/3/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//
import UIKit

class DWSingleCell: UITableViewCell,CellConfigurable{

    @IBOutlet weak var iconView:UIImageView!
    @IBOutlet weak var mainTitleLabel:UILabel!
    var card:DWCard!
    func configureCell(card: DWCard) {
        self.card = card
        self.iconView.af_setImageWithURL(NSURL(string:card.pic!)!)
        self.mainTitleLabel.text = card.desc
    }
}
