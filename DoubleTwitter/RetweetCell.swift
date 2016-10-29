//
//  RetweetCell.swift
//  DoubleTwitter
//
//  Created by Kyou on 10/27/16.
//  Copyright © 2016 Kyou. All rights reserved.
//

import UIKit

class RetweetCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var tweet: Tweet! {
        didSet{
            nameLabel.text = tweet.userName
            accountLabel.text = tweet.userAccount
            avatarImageView.setImageWith(tweet.userProfileUrl!)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-DD-YYYY"
            timeLabel.text = dateFormatter.string(from: tweet.time!)
            titleLabel.text = tweet.text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
