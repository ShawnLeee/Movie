//
//  DWChosenController.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWChosenController: UITableViewController {
    let dataSource = DWChosenService.chosenDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupTableView()
    }
    private func _setupTableView(){
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.registerReusableCell(DWPicsCell)
        tableView.registerReusableCell(DWMoreCell)
        tableView.registerReusableCell(DWFourTitleCell)
        tableView.registerReusableCell(DWSingleCell)
        tableView.registerReusableCell(DWMblogCell)
        tableView.registerReusableCell(DWTwoTitleCell)
        tableView.dataSource = dataSource
    }
}
