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
    var cards:[DWCard]{
        return dataSource.items
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupTableView()
    }
    private func _setupTableView(){
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .None
        tableView.registerReusableCell(DWPicsCell)
        tableView.registerReusableCell(DWMoreCell)
        tableView.registerReusableCell(DWFourTitleCell)
        tableView.registerReusableCell(DWSingleCell)
        tableView.registerReusableCell(DWMblogCell)
        tableView.registerReusableCell(DWTwoTitleCell)
        tableView.dataSource = dataSource
    }
}
extension DWChosenController
{
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let card = cards[section]
        let headerView = UIView(frame:CGRectZero)
        if let headerTitle = card.headTitle
        {
            let headeLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 18))
            headeLabel.text = headerTitle
            headeLabel.textColor = UIColor.darkGrayColor()
            headeLabel.font = UIFont.systemFontOfSize(12)
            headerView.addSubview(headeLabel)
        }
        return headerView
    }
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame:CGRectZero)
    }
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let card = cards[section]
        if let _ = card.headTitle{
            return 18
        }
        return 6
    }
}
extension UITableViewCell{
    override public func awakeFromNib() {
         super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad
        {
        }
    }
}
