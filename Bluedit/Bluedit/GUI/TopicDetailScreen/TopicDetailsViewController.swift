//
//  TopicDetailsViewController.swift
//  Bluedit
//
//  Created by Marcus on 23/06/2024.
//

import UIKit

class TopicDetailsViewController: UIViewController {
    
    
    var topicDetailsView: TopicDetailsView {
        return view as! TopicDetailsView
    }
    var viewModel: TopicDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupBindings()
        
        // Adding back button image
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "xmark")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "xmark")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.backItem?.title = "Custom"
    }
    
    func setupTableView() {
        topicDetailsView.tableView.dataSource = self
        topicDetailsView.tableView.delegate = self
        topicDetailsView.tableView.separatorStyle = .none
        topicDetailsView.tableView.showsVerticalScrollIndicator = false
        topicDetailsView.tableView.rowHeight = UITableView.automaticDimension
    }
    
    func setupBindings() {
        self.viewModel.reloadTableView = { [weak self] in
            self?.topicDetailsView.tableView.reloadData()
        }
    }
}

extension TopicDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.topicDetailsView.tableView.dequeueReusableCell(withIdentifier: TopicDetailTableViewCell.cellIdentifier, for: indexPath) as! TopicDetailTableViewCell
        cell.updateDisplay(model: self.viewModel.topicModel ?? nil, index: self.viewModel.index ?? 0)
        cell.selectionStyle = .none
    
        return cell
    }
}
