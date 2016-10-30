//
//  Tweet.swift
//  DoubleTwitter
//
//  Created by Kyou on 10/28/16.
//  Copyright © 2016 Kyou. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var userName: String?
    var userProfileUrl: URL?
    var userAccount: String?
    var time: Date?
    var timeFromNow: String?
    var text: String?
    var isRetweeted: Bool?
    var retweetCount: Int?
    var favoriteCount: Int?
    
    init(dict: [String: AnyObject]) {
        userName = dict["user"]?["name"] as? String ?? ""
        
        if let userAccount = dict["user"]!["screen_name"] as? String{
            self.userAccount = "@\(userAccount)"
        }
        userProfileUrl = URL(string: dict["user"]?["profile_image_url"] as! String)
        
        if let timeString = dict["created_at"] as? String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        time = dateFormatter.date(from: timeString)!
        
        timeFromNow = "\(Int(round(Date().timeIntervalSince(time!)/3600)))h"
            
            
        text = dict["text"] as? String ?? ""
        isRetweeted = dict["retweeted"] as? Bool ?? false
        retweetCount = dict["retweet_count"] as? Int ?? 0
            favoriteCount = dict["favorites_count"] as? Int ?? 0
        }
    }
    
    class func tweetWithArray(dictionaries: [[String: AnyObject]]) -> [Tweet]{
        var tweets = [Tweet]()
        
        for dictionary in dictionaries{
            tweets.append(Tweet(dict: dictionary))
        }
        
        return tweets
    }
}
