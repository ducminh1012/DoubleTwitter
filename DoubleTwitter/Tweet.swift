//
//  Tweet.swift
//  DoubleTwitter
//
//  Created by Kyou on 10/28/16.
//  Copyright © 2016 Kyou. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var userName: String
    var userAccount: String
    var time: String
    var text: String
    var isRetweeted: Bool
    
    init(dict: [String: AnyObject]) {
        userName = dict["user"] as? String ?? ""
        userAccount = dict["account"] as? String ?? ""
        time = dict["time"] as? String ?? ""
        text = dict["text"] as? String ?? ""
        isRetweeted = dict["retweeted"] as? Bool ?? false
    }
}
