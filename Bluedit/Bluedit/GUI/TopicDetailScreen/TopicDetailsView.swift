//
//  TopicDetailsView.swift
//  Bluedit
//
//  Created by Marcus on 23/06/2024.
//

import UIKit

class TopicDetailsView: UIView {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.registerTableViewCellFromNib(nibName: TopicDetailTableViewCell.cellIdentifier)
        }
    }
}
