//
//  DWRankController.swift
//  Movie
//
//  Created by Daniel on 16/3/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWRankController: UITableViewController {
    var pageViewModel =  DWRankPageViewModel()
    var viewModels:[DWRankViewModel]{
        return pageViewModel.movieList
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        _setupSelf()
    }

}
extension DWRankController
{
    private func _setupSelf(){
        do{
            pageViewModel =  try DWRankService.rankPageViewModel()
        }catch
        {
            
        }
        self.title = "榜单"
        tableView.rowHeight = 112
        tableView.registerReusableCell(DWRankCell)
        _setupTopView()
    }
    private func _setupTopView()
    {
        do{
            let rankTopView =  try UIView.loadViewFromNib() as DWRankTopView
            rankTopView.pagerankViewModel = pageViewModel
            self.tableView.tableHeaderView = rankTopView
        }catch LoadNibError.NotExist
        {
            print("nib file not exist")
        }
        catch{
            print("other error")
        }
    }
}
extension DWRankController
{
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueResuableCell() as DWRankCell
            cell.rankViewModel = viewModels[indexPath.row]
            return cell
    }
}
extension DWRankController
{
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY > 0
        {
        }
        
    }
}
