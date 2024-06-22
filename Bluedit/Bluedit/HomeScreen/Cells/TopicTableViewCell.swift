//
//  TopicTableViewCell.swift
//  Bluedit
//
//  Created by Marcus on 22/06/2024.
//

import Foundation
import UIKit

class TopicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var timePostedLabel: UILabel!
    
    @IBOutlet weak var topicTitleLabel: UILabel!
    @IBOutlet weak var topicPreviewLabel: UILabel!
    
    
    @IBOutlet weak var upvoteButton: UIButton!
    @IBOutlet weak var downvoteButton: UIButton!
    @IBOutlet weak var upvoteCounter: UILabel!
    
    func updateDisplay(model: TopicModel) {
        self.groupImage.image = model.groupImage
        self.groupNameLabel.text = model.groupNameLabel
        self.timePostedLabel.text = model.timePostedLabel
        
        self.topicTitleLabel.text = model.topicTitleLabel
        self.topicTitleLabel.text = model.topicPreviewLabel
        
        self.upvoteCounter.text = String(model.upvoteCounter ?? 0)
    }
    
    @IBAction func onUpvoteButtonClicked(_ sender: Any) {
        if let currentCount = Int(self.upvoteCounter.text ?? "0") {
            let newCount = currentCount + 1
            self.upvoteCounter.text = "\(newCount)"
        }
    }
    
    @IBAction func onDownvoteButtonClicked(_ sender: Any) {
        if let currentCount = Int(self.upvoteCounter.text ?? "0") {
            let newCount = currentCount - 1
            self.upvoteCounter.text = "\(newCount)"
        }
    }
}
