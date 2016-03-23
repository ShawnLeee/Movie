//
//  DWFourTitleCell.swift
//  Movie
//
//  Created by Daniel on 16/3/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWFourTitleCell: UITableViewCell ,CellConfigurable{

    @IBOutlet var btns: [UIButton]!
    var card:DWCard?
    func configureCell(card: DWCard) {
        self.card = card
        for index in 0..<(card.group?.count)!{
            if index < btns.count
            {
                let btn = btns[index]
                if let cardItem = card.group?[index]{
                    btn.setTitle(cardItem.titleSub, forState: .Normal)
                }
            }
        }
    }
}
