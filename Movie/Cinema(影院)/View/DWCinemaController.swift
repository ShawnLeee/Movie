//
//  DWCinemaController.swift
//  Movie
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWCinemaController: UITableViewController {
    var cinemaViewModels = [DWCinemaViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelf()
    }
    private func setupSelf()
    {
        title = "影院"
        cinemaViewModels = DWCinemaService.cinemaViewModels()
        tableView.rowHeight = 98
        tableView.registerReusableCell(DWCinemaCell)
    }
    //MARK : - tableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cinemaViewModels.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResuableCell() as DWCinemaCell
        cell.cinemaViewModel = cinemaViewModels[indexPath.row]
        return cell
    }
    
}
