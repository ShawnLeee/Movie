//
//  DWMovieCell.swift
//  Movie
//
//  Created by Daniel on 16/3/12.
//  Copyright © 2016年 Daniel. All rights reserved.
//
import AlamofireImage
import UIKit
@objc protocol MovieCellDelegate
{
   func movieCellClickedButton(cell:DWMovieCell,btnModel:DWMovieBtnModel)
    func movieCellClickedPlayBtn(cell:DWMovieCell,movieModel:DWMovieModel)
}
class DWMovieCell: UITableViewCell,CellResuable {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var playButton:UIButton!
    @IBOutlet weak var buyBtn:DWBuyButton!
    
    weak var cellDelegate:MovieCellDelegate?
    var movieModel:DWMovieModel!{
        didSet{
            self.nameLabel.text = movieModel.name
            if let _tosee = movieModel.wanttosee
            {
                if _tosee > 10000
                {
                    self.scoreLabel.text = "1万人想看"
                }else
                {
                    self.scoreLabel.text = "\(_tosee)人想看"
                }
            }
            if var _score = movieModel.score
            {
                _score = _score + "分"
                self.scoreLabel.text = _score
            }
            self.imgView.af_setImageWithURL(NSURL(string: movieModel.poster_url!)!)
            self.genreLabel.text = movieModel.genre
            self.actorsLabel.text = movieModel.actorsString
            self.buyBtn.btnModel = movieModel.button
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.buyBtn.buttonClicked = {[unowned self] model in
            self.cellDelegate?.movieCellClickedButton(self, btnModel: model)
        }
        self.playButton.addTarget(self, action: "_play", forControlEvents: .TouchUpInside)
    }
    func _play()
    {
        self.cellDelegate?.movieCellClickedPlayBtn(self, movieModel: movieModel)
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension Double
{
    var stringValue:String
    {
        return String(self)
    }
}
