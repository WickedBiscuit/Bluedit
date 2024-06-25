//
//  TopicDetailBottomTableViewCell.swift
//  Bluedit
//
//  Created by Marcus on 23/06/2024.
//

import UIKit

class TopicDetailBottomTableViewCell: UITableViewCell {
    var index: Int?
    @IBOutlet weak var counterLabel: UILabel!
    
    func updateDisplay(counterNumber: Int, index: Int) {
        self.counterLabel.text = String(counterNumber)
        
        self.index = index
    }
    
    @IBAction func onUpvoteButtonPressed(_ sender: Any) {
        if let currentCount = Int(self.counterLabel.text ?? "0") {
            let newCount = currentCount + 1
            self.counterLabel.text = "\(newCount)"
            
            guard let rowIndex = self.index else {
                return
            }
            
            DataManager.shared.topicsDataArray[rowIndex].upvoteCounter = (DataManager.shared.topicsDataArray[rowIndex].upvoteCounter ?? 0) + 1
        }
    }
    @IBAction func onDownvoteButtonPressed(_ sender: Any) {
        if let currentCount = Int(self.counterLabel.text ?? "0") {
            let newCount = currentCount - 1
            self.counterLabel.text = "\(newCount)"
            
            guard let rowIndex = self.index else {
                return
            }
            
            DataManager.shared.topicsDataArray[rowIndex].upvoteCounter = (DataManager.shared.topicsDataArray[rowIndex].upvoteCounter ?? 0) - 1
        }
    }
    
}
