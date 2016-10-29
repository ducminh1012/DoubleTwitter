//
//  User.swift
//  DoubleTwitter
//
//  Created by Kyou on 10/28/16.
//  Copyright © 2016 Kyou. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String?
    var screenName: String?
    var profileUrl: URL?
    var userDescription: String?
    
    var dictionary: [String: AnyObject]?
    
    init(dictionary: [String: AnyObject]) {
        
        self.dictionary = dictionary
        name = dictionary["name"] as? String ?? ""
        screenName = dictionary["screen_name"] as? String ?? ""
        profileUrl = URL(string: dictionary["profile_image_url_https"] as? String ?? "")
        userDescription = dictionary["description"] as? String ?? ""
    }
    
    static var _currentUser: User?
    
    class var currentUser: User?{
        get{
            if _currentUser == nil{
                
                let userDefault = UserDefaults.standard
                let userData = userDefault.object(forKey: "currentUserData") as? Data
                
                if let userData =  userData{
                    
                    let dictionary = NSKeyedUnarchiver.unarchiveObject(with: userData) as! [String: AnyObject]
                    
                    _currentUser = User(dictionary: dictionary)
                }
                
                
            }
            
            return _currentUser

        }
        
        
        set(user){
            let userDefault = UserDefaults.standard
            
            if let user = user{
                
//                print(user.dictionary)
                
                let data = NSKeyedArchiver.archivedData(withRootObject: user.dictionary)

                
                userDefault.set(data, forKey: "currentUserData")
            }else{
                userDefault.set(nil, forKey: "currentUserData")
            }
            
            userDefault.set(user, forKey: "currentUser")
            
            userDefault.synchronize()
        }

    }
}
