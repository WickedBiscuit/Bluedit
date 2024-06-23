//
//  TopicDetailTopTableViewCell.swift
//  Bluedit
//
//  Created by Marcus on 23/06/2024.
//

import UIKit

class TopicDetailTopTableViewCell: UITableViewCell {
    @IBOutlet weak var groupImageView: UIImageView!
    
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    func updateDisplay(groupImageView: UIImage, groupName: String, username: String, postedTimelapse: String) {
        self.groupImageView.image = groupImageView
        self.groupLabel.text = groupName
        self.usernameLabel.text = "u/" + username + " - " + postedTimelapse
    }
}
