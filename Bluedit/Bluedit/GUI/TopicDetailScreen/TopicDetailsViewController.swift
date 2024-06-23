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
    }
    
    func setupTableView() {
        topicDetailsView.tableView.dataSource = self
        topicDetailsView.tableView.delegate = self
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
