//
//  DWBuyButton.swift
//  Movie
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit
class DWBuyButton: UIButton {
    typealias buttonTouchInsideEvent = (model:DWMovieBtnModel) -> ()
    
    var buttonClicked:buttonTouchInsideEvent!
    
    var btnModel:DWMovieBtnModel?
        {
        didSet{
            self.setTitle(btnModel?.buttonType?.rawValue, forState: .Normal)
            self.backgroundColor = btnModel?.buttonType?.buttonColor()
        }
    }
    override func awakeFromNib() {
        self.layer.cornerRadius = 4.0
        self.addTarget(self, action: "_touchInside:", forControlEvents: .TouchUpInside)
    }
    func _touchInside(sender:UIButton)
    {
        buttonClicked(model: btnModel!)
    }
}
enum DWButtonType:String
{
    case Buy = "购票"
    case PreSale = "预售"
    case WantSee = "想看"
    func buttonColor() -> UIColor
    {
        switch self
        {
        case .Buy:
            return UIColor.buyButtonColor()
        case .PreSale:
            return UIColor.preBuyColor()
        case .WantSee:
            return UIColor.buyButtonColor()
            
        }
    }
}