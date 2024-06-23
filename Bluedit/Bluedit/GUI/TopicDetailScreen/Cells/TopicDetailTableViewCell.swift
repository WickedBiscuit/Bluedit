//
//  TopicDetailTableViewCell.swift
//  Bluedit
//
//  Created by Marcus on 23/06/2024.
//

import UIKit

class TopicDetailTableViewCell: UITableViewCell {
    var index: Int?
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.registerTableViewCellFromNib(nibName: TopicDetailTopTableViewCell.cellIdentifier)
            tableView.registerTableViewCellFromNib(nibName: TopicDetailContentSectionTableViewCell.cellIdentifier)
            tableView.registerTableViewCellFromNib(nibName: TopicDetailBottomTableViewCell.cellIdentifier)
        }
    }
    
    var model: TopicModel?
    
    func updateDisplay(model: TopicModel?, index: Int) {
        guard (model != nil) else {
            return
        }
        
        self.model = model
        self.index = index
        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none

        // Reload table after setting up the table view 
        self.tableView.reloadData()
    }
}

extension TopicDetailTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard (self.model != nil) else {
            return 0
        }
        
        return 3 // Should generate 3 cells only for 3 separate parts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.row) {
            case 0:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: TopicDetailTopTableViewCell.cellIdentifier, for: indexPath) as! TopicDetailTopTableViewCell
                cell.updateDisplay(groupImageView: self.model?.groupImage ?? UIImage(), groupName: self.model?.groupNameLabel ?? "", username: self.model?.posterUsername ?? "", postedTimelapse: self.model?.timePostedLabel ?? "")
                cell.selectionStyle = .none
            
                return cell
            case 1:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: TopicDetailContentSectionTableViewCell.cellIdentifier, for: indexPath) as! TopicDetailContentSectionTableViewCell
                cell.updateDisplay(title: self.model?.topicTitleLabel ?? "", content: self.model?.topicPreviewLabel ?? "" )
                cell.selectionStyle = .none
            
                return cell
                
            case 2:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: TopicDetailBottomTableViewCell.cellIdentifier, for: indexPath) as! TopicDetailBottomTableViewCell
            
                cell.updateDisplay(counterNumber: self.model?.upvoteCounter ?? 0, index: self.index ?? 0)
                cell.selectionStyle = .none
                return cell
            default:
                return UITableViewCell()
        }
    }
    
    
}
