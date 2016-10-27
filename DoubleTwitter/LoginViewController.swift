//
//  ViewController.swift
//  DoubleTwitter
//
//  Created by Kyou on 10/25/16.
//  Copyright © 2016 Kyou. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    @IBAction func onLoginButton(_ sender: UIButton) {
        TwitterClient.shared.fetchRequest()
        
//        performSegue(withIdentifier: "onLoginSuccess", sender: self)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

