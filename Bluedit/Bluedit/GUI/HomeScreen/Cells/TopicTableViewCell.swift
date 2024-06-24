//
//  TopicTableViewCell.swift
//  Bluedit
//
//  Created by Marcus on 22/06/2024.
//

import Foundation
import UIKit

protocol TopicTableViewCellDelegate: AnyObject {
    func upvoteCounterUpdated()
}

class TopicTableViewCell: UITableViewCell {
    var index: Int?
    weak var delegate: TopicTableViewCellDelegate?
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var timePostedLabel: UILabel!
    
    @IBOutlet weak var topicTitleLabel: UILabel!
    @IBOutlet weak var topicPreviewLabel: UILabel!
    
    
    @IBOutlet weak var upvoteButton: UIButton!
    @IBOutlet weak var downvoteButton: UIButton!
    @IBOutlet weak var upvoteCounter: UILabel!
    
    func updateDisplay(model: TopicModel, index: Int) {
        self.groupImage.image = model.groupImage
        self.groupNameLabel.text = model.groupNameLabel
        self.timePostedLabel.text = convertTimeInterval(from: model.postedTimeStamp ?? Date())
        
        self.topicTitleLabel.text = model.topicTitleLabel
        self.topicPreviewLabel.text = model.topicPreviewLabel
        
        self.upvoteCounter.text = String(model.upvoteCounter ?? 0)
        
        self.index = index
    }
    
    @IBAction func onUpvoteButtonClicked(_ sender: Any) {
        if let currentCount = Int(self.upvoteCounter.text ?? "0") {
            let newCount = currentCount + 1
            self.upvoteCounter.text = "\(newCount)"
            
            guard let rowIndex = self.index else {
                return
            }
            
            DataManager.shared.topicsDataArray[rowIndex].upvoteCounter = (DataManager.shared.topicsDataArray[rowIndex].upvoteCounter ?? 0) + 1
            
            delegate?.upvoteCounterUpdated()
        }
    }
    
    @IBAction func onDownvoteButtonClicked(_ sender: Any) {
        if let currentCount = Int(self.upvoteCounter.text ?? "0") {
            let newCount = currentCount - 1
            self.upvoteCounter.text = "\(newCount)"
            
            guard let rowIndex = self.index else {
                return
            }
            
            DataManager.shared.topicsDataArray[rowIndex].upvoteCounter = (DataManager.shared.topicsDataArray[rowIndex].upvoteCounter ?? 0) - 1
            
            delegate?.upvoteCounterUpdated()
        }
    }
}
