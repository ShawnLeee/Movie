//
//  DWMblogCell.swift
//  Movie
//
//  Created by Daniel on 16/3/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWMblogCell: UITableViewCell ,CellConfigurable{

    var card:DWCard?
    func configureCell(card: DWCard) {
        self.card = card
    }
}
