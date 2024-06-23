//
//  HomeScreenViewModel.swift
//  Bluedit
//
//  Created by Marcus on 21/06/2024.
//

import Foundation
import UIKit


class HomeScreenViewModel: HomeScreenViewModelProtocol {
    weak var delegate : HomeScreenViewModelDelegate?
    var reloadTableView: (()->())?
    var dataArray: [TopicModel] = []
    
    func callTopicApi() {
        // Call mock api and assign mock data
        let groupImage = UIImage(named: "TempCommunityIcon")
        
        let topics: [TopicModel] = [
            TopicModel(groupImage: groupImage, groupNameLabel: "r/Swift", timePostedLabel: "16h", topicTitleLabel: "This is a rather long topic title", topicPreviewLabel: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce consectetur justo sit amet justo fermentum sodales. Proin a metus vestibulum, ultricies nisi nec, aliquam tellus. Sed auctor augue non nisi consequat, nec dignissim mauris vestibulum. Phasellus vel consectetur justo. Sed porttitor purus ut risus hendrerit, a consectetur ligula tincidunt. Nullam sed elit id eros lacinia posuere. Quisque rhoncus mi et velit accumsan, a posuere nulla vehicula. Nulla rutrum lectus sed efficitur auctor. Aenean et ligula in ligula accumsan sagittis. Proin nec ultricies orci.", upvoteCounter: 10),
            TopicModel(groupImage: groupImage, groupNameLabel: "r/iOS", timePostedLabel: "10mo", topicTitleLabel: "Topic 2", topicPreviewLabel: "Preview of Topic 2", upvoteCounter: 15),
            TopicModel(groupImage: groupImage, groupNameLabel: "r/Flutter", timePostedLabel: "1d", topicTitleLabel: "Topic 3", topicPreviewLabel: "Preview of Topic 3", upvoteCounter: 20),
        ]
        
        dataArray = topics
        
        self.reloadTableView?()

    }
}
