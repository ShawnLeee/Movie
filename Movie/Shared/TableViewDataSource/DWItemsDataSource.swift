//
//  DWCardDataSource.swift
//  Movie
//
//  Created by Daniel on 16/3/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWItemsDataSource: NSObject {
    var items:[DWCard]
    init(items:[DWCard])
    {
        self.items = items
        super.init()
    }
}
extension DWItemsDataSource:UITableViewDataSource
{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let card = items[section]
        if card.hasCardGroup
        {
            return (card.cardGroup?.count)!
        }else
        {
            return 1
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let card = items[indexPath.section]
        if card.hasCardGroup
        {
            let finalCard = card.cardGroup![indexPath.row]
            let cell = tableView.dequeueReusableCellWithIdentifier((finalCard.cardType?.cellItentifier())!, forIndexPath: indexPath)
            _configureCell(cell,card: finalCard)
            return cell
        }else
        {
            let cell = tableView.dequeueReusableCellWithIdentifier((card.cardType?.cellItentifier())!, forIndexPath: indexPath)
            _configureCell(cell,card:card)
            return cell;
        }
    }
    private func _configureCell(cell:UITableViewCell,card:DWCard)
    {
        if let _cell = cell as? CellConfigurable
            {
                _cell.configureCell(card)
            }
    }
}
