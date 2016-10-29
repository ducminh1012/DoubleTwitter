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
        
        if let accessToken = UserDefaults.standard.string(forKey: "access_token_query"){
            
            TwitterClient.shared?.getData(path: "1.1/statuses/home_timeline.json", completion: { (task, respone) in
//                print(respone)
                
                let dictionaries = respone as! [[String: AnyObject]]
                
                self.tweets = Tweet.tweetWithArray(dictionaries: dictionaries)

                
                self.tweetTableView.reloadData()
                
                
                }, failure: { (task, error) in
                    print(error)
            })
        }
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

