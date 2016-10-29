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
    
    @IBOutlet weak var tweetTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tweetTableView.delegate = self
        tweetTableView.dataSource = self
        
        // Do any additional setup after loading the view.

//        TwitterClient.shared?.fetchAccess(success: { (accessToken) in
//            print("got accessToken: \(accessToken)")
//            }, failure: { (error) in
//                print(error)
//        })
        
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

