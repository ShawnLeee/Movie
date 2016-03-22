//
//  MappableType.swift
//  Movie
//
//  Created by Daniel on 16/3/19.
//  Copyright © 2016年 Daniel. All rights reserved.
//
import ObjectMapper
import Foundation
import UIKit
protocol MappableType{
    typealias JSONField : RawRepresentable
}

extension Mappable {
//    typealias JSONField = MappableType
}
protocol DWMappable:Mappable,MappableType
{
    
}
