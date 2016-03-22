//
//  ViewController.swift
//  Movie
//
//  Created by Daniel on 16/3/12.
//  Copyright © 2016年 Daniel. All rights reserved.
//
import MediaPlayer
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieContainerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avartarImage:UIImageView!
    @IBOutlet weak var animateView: UIView!
    @IBOutlet weak var headerLabel:UILabel!
    let moviePlayer = MPMoviePlayerController(contentURL: NSURL(string: "http://v.iask.com/v_play_ipad.php?vid=139309659"))
    var blurView:UIVisualEffectView! =  UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
    override func viewDidLoad() {
        super.viewDidLoad()
        moviePlayer.movieSourceType = .Streaming
        moviePlayer.view.frame = movieContainerView.bounds
        movieContainerView.addSubview(moviePlayer.view)
        moviePlayer.play()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        animateView.insertSubview(blurView, belowSubview: headerLabel)
        animateView.clipsToBounds = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController : UIScrollViewDelegate
{
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        var headerTransform = CATransform3DIdentity
        var avatarTransform = CATransform3DIdentity
        if offset < 0
        {
            let headerScale = -(offset)/animateView.bounds.height
            let headerSizevariation:CGFloat = (animateView.bounds.height * headerScale)/2
            headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
            headerTransform = CATransform3DScale(headerTransform, 1 + headerScale, 1 + headerScale, 0)
            animateView.layer.transform = headerTransform
        }else{
            //Label
            let labelTransform = CATransform3DMakeTranslation(0, max(-35, -(107 - offset)), 0)
            nameLabel.layer.transform = labelTransform
            //Header
           headerTransform  = CATransform3DTranslate(headerTransform, 0, max(-40,-offset), 0)
            //Avatar
            let avatarScaleFactor = (min(40, offset))/avartarImage.bounds.height/1.4
            let avatarSizeVariation = ((avartarImage.bounds.height * (1.0 + avatarScaleFactor)) - avartarImage.bounds.height)/2
            avatarTransform = CATransform3DTranslate(avatarTransform, 0, avatarSizeVariation, 0)
            avatarTransform = CATransform3DScale(avatarTransform, 1.0 - avatarScaleFactor, 1.0 - avatarScaleFactor, 0)
            if offset <= 40
            {
                if avartarImage.layer.zPosition < animateView.layer.zPosition {
                    animateView.layer.zPosition = 0
                }
            }else
            {
                if avartarImage.layer.zPosition >= animateView.layer.zPosition
                {
                    animateView.layer.zPosition = 2
                }
            }
            
        }
        animateView.layer.transform = headerTransform
        avartarImage.layer.transform = avatarTransform
    }
}

