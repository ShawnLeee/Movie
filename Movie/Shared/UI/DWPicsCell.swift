//
//  DWPicsCell.swift
//  Movie
//
//  Created by Daniel on 16/3/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWPicsCell: UITableViewCell,CellConfigurable {
    @IBOutlet weak var containerView:DWPhotoContainerView!
    var card:DWCard?
    func configureCell(card: DWCard) {
         self.card = card
        containerView.card = card
    }
}
