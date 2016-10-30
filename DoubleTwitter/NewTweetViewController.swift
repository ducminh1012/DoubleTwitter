//
//  NewTweetViewController.swift
//  DoubleTwitter
//
//  Created by Kyou on 10/30/16.
//  Copyright © 2016 Kyou. All rights reserved.
//

import UIKit

class NewTweetViewController: UIViewController {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var messageTextView: UITextView!
    
    
    @IBAction func onCancelButton(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onTweetButon(_ sender: AnyObject) {
        
        TwitterClient.shared?.postData(path: "1.1/statuses/update.json", dictionary: NSDictionary(dictionary: ["status" : self.messageTextView.text]), completion: { (task, respone) in
//            let alert = UIAlertController(title: "Alert", message: "Your tweet has been sent!", preferredStyle: UIAlertControllerStyle.alert)
//            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
//            alert.addAction(action)
//            
//            alert.show(self, sender: nil)
            self.dismiss(animated: true, completion: nil)
            
            }, failure: { (task, error) in
                print(error)
        })
        
    }
    
    var user = User.currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profileImageView.setImageWith((user?.profileUrl)!)
        nameLabel.text = user?.name
        accountLabel.text = "@\(user?.screenName)"
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
