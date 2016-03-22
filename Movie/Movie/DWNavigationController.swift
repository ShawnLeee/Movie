//
//  DWNavigationController.swift
//  Movie
//
//  Created by Daniel on 16/3/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWNavigationController: UINavigationController {
    var transparent:CGFloat = 0.0{
        didSet{
            let image = UIImage.imageWithColor(UIColor.blackColor().colorWithAlphaComponent(transparent))
            UINavigationBar.appearance().setBackgroundImage(image, forBarMetrics: .Default)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

