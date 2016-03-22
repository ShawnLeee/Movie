//
//  NSDictionaryExt.swift
//  Movie
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import Foundation
extension NSDictionary {
    static func dictionaryWithLocalJSONFile(fileName:String) -> NSDictionary?
    {
        let filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: nil)
        if let filePath = filePath
        {
            let data = NSData(contentsOfFile: filePath)
            guard let jdata = data else{ return nil }
            do
            {
                
              let dict = try NSJSONSerialization.JSONObjectWithData(jdata, options:.AllowFragments)
                return dict["data"] as? NSDictionary
            }catch{
                return nil
            }
            
        }
        return nil
    }
}