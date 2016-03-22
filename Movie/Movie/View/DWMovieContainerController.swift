//
//  DWMovieContainerController.swift
//  Movie
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWMovieContainerController: UIViewController {

    let segmentControl = UISegmentedControl(items: ["热映","预告"])
    let hotVC = DWMovieController(jsonfileN: "hotmovie.json")
    let comingVC = DWMovieController(jsonfileN: "coming.json")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set segmentControl
        segmentControl.tintColor = UIColor.buyButtonColor()
        segmentControl.selectedSegmentIndex = 0
        segmentControl.bounds = CGRect(x: 0, y: 0, width: 108, height: 30)
        segmentControl.addTarget(self, action: "segmentSelectedIndex", forControlEvents: .ValueChanged)
        //set navigationItem
        self.navigationItem.titleView = segmentControl
        hotVC.nav = self.navigationController
        comingVC.nav = self.navigationController
        _moveVCToFront(hotVC)
        
        // Do any additional setup after loading the view.
    }
    func segmentSelectedIndex()
    {
        let vc = segmentControl.selectedSegmentIndex == 1 ? comingVC : hotVC
        _moveVCToFront(vc)
    }
    func _moveVCToFront(vc:UIViewController)
    {
        if vc.isEqual(hotVC)
        {
            comingVC.view.removeFromSuperview()
        }else
        {
            hotVC.view.removeFromSuperview()
        }
        vc.edgesForExtendedLayout = .None
        vc.view.frame = self.view.bounds
        self.view.addSubview(vc.view)
    }
}
