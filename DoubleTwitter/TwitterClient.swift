//
//  TwitterClient.swift
//  DoubleTwitter
//
//  Created by Kyou on 10/27/16.
//  Copyright © 2016 Kyou. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: NSObject {
    static let shared = TwitterClient()
    
    var client: BDBOAuth1SessionManager?
    var requestToken: BDBOAuth1Credential?
    var accessToken: BDBOAuth1Credential?
    
    private override init(){
        super.init()
        client = BDBOAuth1SessionManager(baseURL: URL(string: "https://api.twitter.com"), consumerKey: "gCBUTVXbqZgU2TN10A66zK4T3", consumerSecret: "f2Uh305HbV9f4LOyJOSifvvTInUSQYOxUERxjIm2Vvt99AgMr7")
    
    }
    
    func fetchRequest(){
        client?.deauthorize()
        
        client?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: URL(string: "doubleTwitter://oauth"), scope: nil, success: { (requestToken) in
            
            
            let url = URL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken!.token!)")
            
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            
            }, failure: { (error) in
                print(error)
        })
    }
    
    func fetchAccess(success: @escaping  (_ accessToken: BDBOAuth1Credential?) -> (), failure: (@escaping (Error?) -> ())){
        client?.fetchAccessToken(withPath: "oauth/access_token", method: "GET", requestToken: requestToken, success: success, failure: failure)

    }
    
    func getData(path: String, completion: @escaping (_ task: URLSessionDataTask,_ respone: Any?) -> (), failure: @escaping (_ task: URLSessionDataTask?,_ error: Error) -> () ){
        
        self.client?.get(path, parameters: nil, progress: nil, success: completion, failure: failure)
        
    }
    
}
