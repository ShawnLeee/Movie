//
//  DWPinController.swift
//  Movie
//
//  Created by Daniel on 16/3/18.
//  Copyright © 2016年 Daniel. All rights reserved.
//
import PinterestSDK
import UIKit
import AVFoundation
private let reuseIdentifier = "Cell"

class DWPinController: UICollectionViewController {
    let pinModel = DWPinService.pageModel()
    var pins:[DWPinModel] {
        return pinModel.data
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        PDKClient.configureSharedInstanceWithAppId("4824458541674807488")
        PDKClient.sharedInstance().authenticateWithPermissions([PDKClientReadPublicPermissions], withSuccess: { (response) -> Void in
            
            }) { (error) -> Void in
                
        }
        _setupSelf()
    }
    private func _setupSelf(){
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        collectionView?.registerReusableCell(DWPinCell)
    }
    // MARK: UICollectionViewDataSource
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pins.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(indexPath) as DWPinCell
        cell.pinModel = pins[indexPath.row]
        return cell
    }
}
extension DWPinController:UICollectionViewDelegateFlowLayout
{
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
       if let pinImage = pins[indexPath.row].images?._345x {
            return CGSize(width: pinImage.width!, height: pinImage.height!)
        }
        return CGSizeZero
        
    }
}
extension DWPinController:PinterestLayoutDelegate{
    func collectionView(collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: NSIndexPath, withWidth: CGFloat) -> CGFloat {
        let pinImage = pins[indexPath.row].images?._345x
            let imageSize = CGSize(width: pinImage!.width!, height: pinImage!.height!)
        let boundingRect = CGRect(x: 0, y: 0, width: withWidth, height: CGFloat.max)
            let rect  = AVMakeRectWithAspectRatioInsideRect(imageSize, boundingRect)
            return rect.size.height
    }
    
}