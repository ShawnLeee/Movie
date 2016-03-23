//
//  DWScrollView.swift
//  Movie
//
//  Created by Daniel on 16/3/23.
//  Copyright © 2016年 Daniel. All rights reserved.
//

import UIKit

class DWScrollView: UIView {
    init(frame:CGRect,withNetImages netImages:[String])
    {
        _imageArray = netImages
        _maxImageCount = netImages.count
        super.init(frame: frame)
        _setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    private var _imageArray = [String]()
    private var _currentIndex:Int = 0{
        didSet{
            _pageControl.currentPage = _currentIndex
        }
    }
    private var _pageControl = UIPageControl()
    private var _timer:NSTimer?
    private var _maxImageCount:Int = 0
    private var _autoScrollDelay:CGFloat = 0.0
    private var _scrollView:UIScrollView!
    private let _leftImageView = UIImageView()
    private let _middleImageView = UIImageView()
    private let _rightImageView = UIImageView()
    private func _setup() {
        p_createScrollView()
        p_initImageView()
        p_createPageControl()
        p_setupTimer()
        p_changeImageForLeft(_maxImageCount - 1, middleIndex: 0, rightIndex: 1)
    }
    private func p_createPageControl()
    {
        _pageControl.frame = CGRectMake(0, self.bounds.height - 16, self.bounds.width, 8)
        _pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        _pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()   
        _pageControl.numberOfPages = _maxImageCount
        _pageControl.currentPage = 0
        self.addSubview(_pageControl)
    }
    
    private func p_createScrollView()
    {
        let scrollView = UIScrollView(frame: self.bounds)
        self.addSubview(scrollView)
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: self.bounds.width * 3, height: 0)
        _scrollView = scrollView
    }
    deinit
    {
        removeTimer()
    }
   
}
extension DWScrollView : UIScrollViewDelegate
{
    func imageDidTap(tapGesture:UITapGestureRecognizer)
    {
        
    }
    private func p_initImageView()
    {
        let width = self.bounds.width
        let frame = CGRect(x: 0, y: 0, width: width, height: self.bounds.height)
        _leftImageView.frame = CGRectOffset(frame, 0, 0)
        _middleImageView.frame = CGRectOffset(frame, width, 0)
        _rightImageView.frame = CGRectOffset(frame, 2 * width, 0)
        _middleImageView.userInteractionEnabled = true
        _middleImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "imageDidTap:"))
        _scrollView.addSubview(_leftImageView)
        _scrollView.addSubview(_middleImageView)
        _scrollView.addSubview(_rightImageView)
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        if offsetX >= self.bounds.width * 2
        {
            _currentIndex++;
            if _currentIndex == _maxImageCount - 1{//最后一张
                p_changeImageForLeft(_currentIndex - 1, middleIndex: _currentIndex, rightIndex: 0)
            }else if _currentIndex == _maxImageCount {//第一张
                _currentIndex = 0
                p_changeImageForLeft(_maxImageCount - 1, middleIndex: _currentIndex, rightIndex: _currentIndex + 1)
            }else{
                p_changeImageForLeft(_currentIndex - 1, middleIndex: _currentIndex, rightIndex: _currentIndex + 1)
            }
        }
        if offsetX <= 0{
            _currentIndex--;
            if _currentIndex == 0{//第一张
                p_changeImageForLeft(_maxImageCount - 1, middleIndex: _currentIndex, rightIndex: _currentIndex + 1)
            }else if _currentIndex == -1
            {
                _currentIndex = _maxImageCount - 1
                p_changeImageForLeft(_currentIndex - 1, middleIndex: _currentIndex, rightIndex: 0)
            }else
            {
                p_changeImageForLeft(_currentIndex - 1, middleIndex: _currentIndex, rightIndex: _currentIndex + 1)
            }
        }
    }
    private func p_changeImageForLeft(leftIndex:Int,middleIndex:Int,rightIndex:Int)
    {
        _leftImageView.af_setImageWithURL(NSURL(string: _imageArray[leftIndex])!)
        _middleImageView.af_setImageWithURL(NSURL(string: _imageArray[middleIndex])!)
        _rightImageView.af_setImageWithURL(NSURL(string: _imageArray[rightIndex])!)
        _scrollView.setContentOffset(CGPoint(x: self.bounds.width, y: 0), animated: false)
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
         p_setupTimer()
    }
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
         removeTimer()
    }
}
//MARK: - SetupTimer
extension DWScrollView {
    private func p_setupTimer()
    {
        _timer = NSTimer(timeInterval: 1.8, target: self, selector: "p_scroll", userInfo: nil, repeats: true)
        if let timer = _timer
        {
            NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        }
    }
    func p_scroll()
    {
        let width = self.bounds.width
        _scrollView.setContentOffset(CGPointMake(_scrollView.contentOffset.x + width, 0), animated: true)
    }
    private func removeTimer()
    {
        if let timer = _timer
        {
            timer.invalidate()
            _timer = nil
        }
    }
   
}
