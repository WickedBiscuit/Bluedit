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
        self.setupBottomNavigationbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataManager.shared.sortTopicsByUpvote()
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
    
    func setupBottomNavigationbar() {
        let customButtonView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 40)))
        
        // Create an image view
        let imageView = UIImageView(image: UIImage(systemName: "plus"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 35, y: 0, width: 30, height: 30) // Adjust size and position
        customButtonView.addSubview(imageView)
        
        // Create a label for the title
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 35, width: 100, height: 25))
        titleLabel.text = "Create"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        customButtonView.addSubview(titleLabel)
        
        // Add tap gesture recognizer to the custom button view
        let gesture = UITapGestureRecognizer(target: self, action: #selector(addPostButtonPressed))
        customButtonView.addGestureRecognizer(gesture)
        
        // Create UIBarButtonItem with custom view
        let barButtonItem = UIBarButtonItem(customView: customButtonView)
        
        // Assign to the bottomNavigationBar's items array
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        self.homeScreenView.bottomNavigationBar.items = [flexibleSpace, barButtonItem, flexibleSpace]
    }
    
    @objc func addPostButtonPressed()
    {
        self.viewModel.delegate?.directToAddPost()
    }
}

extension HomeScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let totalTopicCount = DataManager.shared.topicsDataArray.count
        
        // If the total is more than 20 , limit it to just top 20
        if(totalTopicCount < 20){
            return totalTopicCount
        } else {
            return 20
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.homeScreenView.tableView.dequeueReusableCell(withIdentifier: TopicTableViewCell.cellIdentifier, for: indexPath) as! TopicTableViewCell
        
        cell.updateDisplay(model: DataManager.shared.topicsDataArray[indexPath.row], index: indexPath.row)
        cell.delegate = self
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.delegate?.directToTopicDetails(model: DataManager.shared.topicsDataArray[indexPath.row], index: indexPath.row)
    }
}

extension HomeScreenViewController: TopicTableViewCellDelegate {
    func upvoteCounterUpdated() {
        // Resort the list of topics and reload table
        DataManager.shared.sortTopicsByUpvote()
        self.homeScreenView.tableView.reloadData()
    }
}
