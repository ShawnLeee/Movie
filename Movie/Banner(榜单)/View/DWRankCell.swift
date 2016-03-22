//
//  DWRankCell.swift
//  Movie
//
//  Created by Daniel on 16/3/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWRankCell: UITableViewCell,CellResuable {
    @IBOutlet weak var rankLabel:UILabel!
    @IBOutlet weak var movieImageView:UIImageView!
    @IBOutlet weak var movieNameLabel:UILabel!
    @IBOutlet weak var actorsLabel:UILabel!
    @IBOutlet weak var topicCountLabel:UILabel!
    @IBOutlet weak var hotScoreLabel:UILabel!
    @IBOutlet weak var commentBnt:UIButton!
    var rankViewModel:DWRankViewModel! {
        didSet{
            movieImageView.af_setImageWithURL(rankViewModel.movieImageURL!)
            movieNameLabel.text = rankViewModel.movieName
            actorsLabel.text = rankViewModel.actors
            topicCountLabel.text = rankViewModel.topicHotCount
            hotScoreLabel.text = rankViewModel.hotScore
            rankLabel.text = rankViewModel.rank
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
