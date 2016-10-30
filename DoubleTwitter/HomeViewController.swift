//
//  HomeViewController.swift
//  DoubleTwitter
//
//  Created by Kyou on 10/27/16.
//  Copyright © 2016 Kyou. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var tweets = [Tweet]()
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tweetTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tweetTableView.delegate = self
        tweetTableView.dataSource = self
        tweetTableView.rowHeight = UITableViewAutomaticDimension
        tweetTableView.estimatedRowHeight = 100
        
        
        refreshControl.addTarget(self, action: #selector(onPullToRefresh(refreshControl:)), for: .valueChanged)
        tweetTableView.insertSubview(refreshControl, at: 0)
        
        TwitterClient.shared?.homeTimeline(success: { (tweets) in
            
            self.tweets = tweets
            
            self.tweetTableView.reloadData()
            
            }, failure: { (error) in
                print(error)
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    func onPullToRefresh(refreshControl: UIRefreshControl){
        
        TwitterClient.shared?.homeTimeline(success: { (tweets) in
            
            self.refreshControl.endRefreshing()
            
            self.tweets = tweets
            
            self.tweetTableView.reloadData()
            
            }, failure: { (error) in
                print(error)
                self.refreshControl.endRefreshing()
        })
        
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "retweetCell") as! RetweetCell
        cell.tweet = tweets[indexPath.row]
        
        return cell
    }
}

