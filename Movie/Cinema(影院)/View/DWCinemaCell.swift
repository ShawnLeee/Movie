//
//  DWCinemaCell.swift
//  Movie
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWCinemaCell: UITableViewCell,CellResuable {

    @IBOutlet weak var cinemaNameLabel:UILabel!
    @IBOutlet weak var addressLabel:UILabel!
    @IBOutlet weak var priceLabel:UILabel!
    @IBOutlet weak var distanceLabel:UILabel!
    @IBOutlet weak var tagView:DWTagView!
    var cinemaViewModel:DWCinemaViewModel!
        {
        didSet{
            cinemaNameLabel.text = cinemaViewModel.cinemaName
            addressLabel.text = cinemaViewModel.address
            priceLabel.text = cinemaViewModel.lowPrice
            distanceLabel.text = cinemaViewModel.distance
            tagView.cinemaTags = cinemaViewModel.tags
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}
