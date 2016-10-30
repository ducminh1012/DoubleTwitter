//
//  TweetDetailViewController.swift
//  DoubleTwitter
//
//  Created by Kyou on 10/30/16.
//  Copyright © 2016 Kyou. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {

    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func onReplyButton(_ sender: AnyObject) {
    }

    
    @IBAction func onRetweetButton(_ sender: AnyObject) {
    }
    
    @IBAction func onFavoriteButton(_ sender: AnyObject) {
    }
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = tweet.userName
        accountLabel.text = tweet.userAccount
        profileImageView.setImageWith(tweet.userProfileUrl!)
        
        timeLabel.text = tweet.timeFromNow
        textLabel.text = tweet.text

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
