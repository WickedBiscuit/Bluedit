//
//  HomeScreenView.swift
//  Bluedit
//
//  Created by Marcus on 21/06/2024.
//

import UIKit

class HomeScreenView: UIView {
    @IBOutlet weak var bottomNavigationBar: UIToolbar!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.registerTableViewCellFromNib(nibName: TopicTableViewCell.cellIdentifier)
        }
    }
    @IBOutlet weak var topView: UIView!
}
