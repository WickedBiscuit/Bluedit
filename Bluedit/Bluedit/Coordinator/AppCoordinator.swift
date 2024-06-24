//
//  AppCoordinator.swift
//  Bluedit
//
//  Created by Marcus on 22/06/2024.
//

import UIKit

class AppCoordinator: NSObject {
    let navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeScreenViewController()
        vc.viewModel = HomeScreenViewModel()
        vc.viewModel.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func navigateToTopicDetails(model: TopicModel, index: Int) {
        let vc = TopicDetailsViewController()
        vc.viewModel = TopicDetailsViewModel()
        vc.viewModel.topicModel = model
        vc.viewModel.index = index
        vc.viewModel.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func navigateToAddPostScreen() {
        let vc = AddPostViewController()
        vc.viewModel = AddPostViewModel()
        vc.viewModel.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
}

extension AppCoordinator: HomeScreenViewModelDelegate {
    func directToTopicDetails(model: TopicModel, index: Int) {
        navigateToTopicDetails(model: model, index: index)
    }
    
    func directToAddPost() {
        navigateToAddPostScreen()
    }
}

extension AppCoordinator: TopicDetailsViewModelDelegate {}

extension AppCoordinator: AddPostViewModelProtocolDelegate {}
