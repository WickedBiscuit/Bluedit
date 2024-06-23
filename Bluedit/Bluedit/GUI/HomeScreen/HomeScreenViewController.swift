//
//  HomeScreenViewController.swift
//  Bluedit
//
//  Created by Marcus on 21/06/2024.
//

import Foundation
import UIKit


class HomeScreenViewController: UIViewController {
    
    var homeScreenView: HomeScreenView {
        return view as! HomeScreenView
    }
    var viewModel: HomeScreenViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupBindings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.reloadTableView?()
    }
    
    func setupBindings() {
        viewModel.callTopicApi()
        
        self.viewModel.reloadTableView = { [weak self] in
            self?.homeScreenView.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        self.homeScreenView.tableView.dataSource = self
        self.homeScreenView.tableView.delegate = self
        self.homeScreenView.tableView.separatorStyle = .none
    }
}

extension HomeScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.topicsDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.homeScreenView.tableView.dequeueReusableCell(withIdentifier: TopicTableViewCell.cellIdentifier, for: indexPath) as! TopicTableViewCell
        
        cell.updateDisplay(model: DataManager.shared.topicsDataArray[indexPath.row], index: indexPath.row)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.delegate?.directToTopicDetails(model: DataManager.shared.topicsDataArray[indexPath.row], index: indexPath.row)
    }
}
