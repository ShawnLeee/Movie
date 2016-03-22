//
//  CellResuable.swift
//  Movie
//
//  Created by Daniel on 16/3/12.
//  Copyright © 2016年 Daniel. All rights reserved.
//
import UIKit
protocol CellResuable:class{
    static var reuseIdentifier:String { get }
    static var nib:UINib? { get }
}
protocol CellConfigurable:CellResuable
{
    func configureCell(card:DWCard)
}
extension CellResuable{
    static var reuseIdentifier:String {
        return String(self)
    }
    static var nib:UINib? {
        return UINib(nibName: String(self), bundle: NSBundle(forClass:self))
    }
}
extension UITableView
{
    func registerReusableCell<T:UITableViewCell where T : CellResuable>( cellType : T.Type)
    {
        if let nib = T.nib
        {
            self.registerNib(nib, forCellReuseIdentifier: T.reuseIdentifier)
        }else
        {
            self.registerClass(cellType, forCellReuseIdentifier: T.reuseIdentifier)
        }
        
    }
    
    func dequeueReusableCell<T:UITableViewCell where T:CellResuable>(indexPath:NSIndexPath) -> T
    {
        return self.dequeueReusableCellWithIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as! T
    }
    func dequeueResuableCell<T:UITableViewCell where T:CellResuable>() -> T
    {
        return self.dequeueReusableCellWithIdentifier(T.reuseIdentifier) as! T
    }
}
extension UICollectionView
{
     func registerReusableCell<T:UICollectionViewCell where T : CellResuable>( cellType : T.Type)
        {
            if let nib = T.nib
            {
                self.registerNib(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
            }else
            {
                self.registerClass(cellType, forCellWithReuseIdentifier: T.reuseIdentifier)
            }
            
        }
        
        func dequeueReusableCell<T:UICollectionViewCell where T:CellResuable>(indexPath:NSIndexPath) -> T
        {
            return self.dequeueReusableCellWithReuseIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as! T
        }
}