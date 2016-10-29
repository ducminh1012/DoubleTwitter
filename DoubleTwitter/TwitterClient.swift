//
//  TwitterClient.swift
//  DoubleTwitter
//
//  Created by Kyou on 10/27/16.
//  Copyright © 2016 Kyou. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {
    static let shared = TwitterClient(baseURL: URL(string: "https://api.twitter.com"), consumerKey: "gCBUTVXbqZgU2TN10A66zK4T3", consumerSecret: "f2Uh305HbV9f4LOyJOSifvvTInUSQYOxUERxjIm2Vvt99AgMr7")
    
//    var client: BDBOAuth1SessionManager?
    var requestToken: BDBOAuth1Credential?
    var accessToken: BDBOAuth1Credential?

    
    func fetchRequest(){
        TwitterClient.shared?.deauthorize()
        
        
        TwitterClient.shared?.fetchRequestToken(withPath: "oauth/request_token", method: "POST", callbackURL: URL(string: "doubleTwitter://oauth"), scope: nil, success: { (requestToken) in
            
            
            let url = URL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken!.token!)")
            
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            
            }, failure: { (error) in
                print(error)
        })
    }
    
    func fetchAccess(success: @escaping  (_ accessToken: BDBOAuth1Credential?) -> (), failure: (@escaping (Error?) -> ())){
        TwitterClient.shared?.fetchAccessToken(withPath: "oauth/access_token", method: "GET", requestToken: requestToken, success: success, failure: failure)

    }
    
    func getData(path: String, completion: @escaping (_ task: URLSessionDataTask,_ respone: Any?) -> (), failure: @escaping (_ task: URLSessionDataTask?,_ error: Error) -> () ){
        
        get(path, parameters: nil, progress: nil, success: completion, failure: failure)
        
    }
    
    func homeTimeline(success: @escaping ([Tweet]) -> (), failure: (Error) -> ()){
        TwitterClient.shared?.getData(path: "1.1/statuses/home_timeline.json", completion: { (task, respone) in
            
            var tweets = [Tweet]()
            
            let dictionaries = respone as! [[String: AnyObject]]
            
            tweets = Tweet.tweetWithArray(dictionaries: dictionaries)

            
            success(tweets)
            
            }, failure: { (task, error) in
                print(error)
        })
    }
    
    func currentUser(success: @escaping (User) -> (), failure: (Error) -> ()){
        get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task, respone) in
            
            let userDictionary = respone as! NSDictionary
            
            let user = User(dictionary: userDictionary)
            
            success(user)
            
            
            }, failure: { (task, error) in
                print(error)
        })
    }
    
}
