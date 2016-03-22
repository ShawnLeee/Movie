//
//  DWMovieController.swift
//  Movie
//
//  Created by Daniel on 16/3/12.
//  Copyright © 2016年 Daniel. All rights reserved.
//
import AVFoundation
import AVKit
import UIKit

class DWMovieController: UITableViewController,MovieCellDelegate {
    let jsonFileName:String
    weak var nav:UINavigationController?
    var movies = [DWMovieModel]()
    init(jsonfileN:String)
    {
        jsonFileName = jsonfileN
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelf()
        movies = MovieDataManager().movieDataWithFileName(jsonFileName)!
    }
    
    private func setupSelf()
    {
        //set tableView
        tableView.rowHeight = 104
        tableView.registerReusableCell(DWMovieCell)
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let movieModel = movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(indexPath) as DWMovieCell
        cell.cellDelegate = self
        cell.movieModel = movieModel
        return cell;
    }
    func movieCellClickedPlayBtn(cell: DWMovieCell, movieModel: DWMovieModel) {
        let videoURL = NSURL(string:movieModel.preview_url!)
        let avplayer = AVPlayer(URL:videoURL!)
        let playerVC = AVPlayerViewController()
        playerVC.player = avplayer
        self.nav!.presentViewController(playerVC, animated: true, completion: nil)
        
    }
    func movieCellClickedButton(cell: DWMovieCell, btnModel: DWMovieBtnModel) {
         
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = UIViewController(nibName: nil, bundle: nil)
        nav!.pushViewController(vc, animated: true)
    }
}
