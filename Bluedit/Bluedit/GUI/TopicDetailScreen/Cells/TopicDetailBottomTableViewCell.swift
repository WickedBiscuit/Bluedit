//
//  TopicDetailBottomTableViewCell.swift
//  Bluedit
//
//  Created by Marcus on 23/06/2024.
//

import UIKit

class TopicDetailBottomTableViewCell: UITableViewCell {
    @IBOutlet weak var counterLabel: UILabel!
    
    func updateDisplay(counterNumber: Int) {
        self.counterLabel.text = String(counterNumber)
    }
    
    @IBAction func onUpvoteButtonPressed(_ sender: Any) {
        if let currentCount = Int(self.counterLabel.text ?? "0") {
            let newCount = currentCount + 1
            self.counterLabel.text = "\(newCount)"
        }
    }
    @IBAction func onDownvoteButtonPressed(_ sender: Any) {
        if let currentCount = Int(self.counterLabel.text ?? "0") {
            let newCount = currentCount - 1
            self.counterLabel.text = "\(newCount)"
        }
    }
    
}
