//
//  PinteresLayout.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit
protocol PinterestLayoutDelegate
{
    func collectionView(collectionView:UICollectionView,heightForPhotoAtIndexPath indexPath:NSIndexPath,withWidth width:CGFloat) -> CGFloat
}
class PinterestLayout: UICollectionViewLayout {
    //MARK:- Property
    var delegate:PinterestLayoutDelegate!
    
    //MARK: - Private Property
    private var cache = [PinterestLayoutAttributes]()
    private var contentHeight:CGFloat = 0.0
    private var numberOfColums  = 2
    private var cellPadding:CGFloat = 6.0
    
    override func prepareLayout() {
        if cache.isEmpty{
            let columnWidth:CGFloat = contentWidth / CGFloat(numberOfColums)
            let width:CGFloat = columnWidth - 2 * cellPadding
            let xOffset:[CGFloat] = [0.0,columnWidth]
            var yOffset = [CGFloat](count: numberOfColums, repeatedValue: 0)
            var column:Int = 0
            for item in 0..<_collectionView.numberOfItemsInSection(0){
                let indexPath = NSIndexPath(forItem: item, inSection: 0)
                let photoHeight = delegate.collectionView(_collectionView, heightForPhotoAtIndexPath: indexPath, withWidth: width)
                let height = photoHeight + 2 * cellPadding + 20
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
                let insetFrame = CGRectInset(frame, cellPadding, cellPadding)
                let attributes = PinterestLayoutAttributes(forCellWithIndexPath: indexPath)
                attributes.frame = insetFrame
                cache.append(attributes)
                
                yOffset[column] += height
                contentHeight = max(contentHeight, CGRectGetMaxY(frame))
                column = column >= (numberOfColums - 1) ? 0 : 1
            }    
        }
        
    }
    
    override func collectionViewContentSize() -> CGSize {
         return _contentSize
    }
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes = [UICollectionViewLayoutAttributes]()
        for attribute in cache {
            if CGRectIntersectsRect(attribute.frame, rect){
                attributes.append(attribute)
            }
        }
        return attributes
    }
    override class func layoutAttributesClass() -> AnyClass {
        return PinterestLayoutAttributes.self
    }
}
//MARK: - Private Var
extension PinterestLayout{
    private var _collectionView:UICollectionView!{
        return collectionView
    }
    private var contentWidth:CGFloat{
        let insets = _collectionView.contentInset
        return _collectionView.bounds.size.width - (insets.left + insets.right)
    }
    private var _contentSize:CGSize{
        return CGSize(width: contentWidth, height: contentHeight)
    }
}