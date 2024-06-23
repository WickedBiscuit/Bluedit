//
//  TopicDetailContentSectionTableViewCell.swift
//  Bluedit
//
//  Created by Marcus on 23/06/2024.
//

import UIKit

class TopicDetailContentSectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func updateDisplay(title: String, content: String) {
        self.titleLabel.text = title
        self.contentLabel.text = content
    }
}
