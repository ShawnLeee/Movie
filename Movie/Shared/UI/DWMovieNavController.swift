//
//  DWMovieNavController.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWMovieNavController: UINavigationController {
    init()
    {
        super.init(nibName: nil, bundle: nil)
        _setupSelf()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _setupSelf()
    }

    private func _setupSelf()
    {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }

}
