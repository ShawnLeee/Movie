//
//  DWMoreCell.swift
//  Movie
//
//  Created by Daniel on 16/3/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWMoreCell: UITableViewCell ,CellConfigurable{
    @IBOutlet weak var mainTitleLabel:UILabel!
    @IBOutlet weak var extraLabel:UILabel!
    var card:DWCard?
    func configureCell(card: DWCard) {
        self.card = card
        self.mainTitleLabel.text = card.desc
        self.extraLabel.text = card.titleExtraText
        if let _showArrow = card.displayArrow
        {
            if _showArrow
            {
                self.accessoryView = UIImageView(image: UIImage(mImge:.common_feed_arrow))
            }
        }
    }
}
