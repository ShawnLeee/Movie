//
//  DWChosenService.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//
import ObjectMapper
import UIKit

class DWChosenService: NSObject {
    static func chosenCards() -> [DWCard]?{
        if let _dict = DWChosenService.dictionaryWithJSONFile("show.json")
        {
            if let _chosenWeibo = _dict["cards"] as? NSArray{
                return Mapper<DWCard>().mapArray(_chosenWeibo)
            }
        }
        return nil
    }
    static func hotWeibo() -> [DWWeiboModel]?
    {
        if let _dict = NSDictionary.dictionaryWithLocalJSONFile("hotweibo.json")
        {
             let _chosenWeibo = _dict["chosen_hotweibo"] as? NSDictionary
             return Mapper<DWWeiboModel>().mapArray(_chosenWeibo!["list"] )
        }
        return nil
    }
    static func chosenDataSource() -> DWItemsDataSource
    {
        let cards = chosenCards()
        let dataSource = DWItemsDataSource(items: cards!)
        return dataSource
    }
    static func dictionaryWithJSONFile(fileName:String) -> NSDictionary?
    {
        let filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: nil)
        if let filePath = filePath
        {
            let data = NSData(contentsOfFile: filePath)
            guard let jdata = data else{ return nil }
            do
            {
                
                let dict = try NSJSONSerialization.JSONObjectWithData(jdata, options:.AllowFragments)
                return dict as? NSDictionary
            }catch{
                return nil
            }
            
        }
        return nil
    }
}
