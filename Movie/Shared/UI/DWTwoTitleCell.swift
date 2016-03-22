//
//  DWTwoTitleCell.swift
//  Movie
//
//  Created by Daniel on 16/3/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWTwoTitleCell: UITableViewCell,CellConfigurable {

    @IBOutlet weak var firstBtn:UIButton!
    @IBOutlet weak var secondBtn:UIButton!
    var card:DWCard?
       
    func configureCell(card: DWCard) {
        self.card = card
        if let _group = card.group
        {
            let firstCardItem = _group.first
            let secondCardItem = _group.last
//            firstBtn.af_setImageForState(.Normal, URL: NSURL(string: (firstCardItem?.icon)!)!)
            firstBtn.setTitle(firstCardItem?.titleSub, forState: .Normal)
            
//            secondBtn.af_setImageForState(.Normal, URL: NSURL(string: (secondCardItem?.icon)!)!)
            secondBtn.setTitle(secondCardItem?.titleSub, forState: .Normal)
        }
    }
}
