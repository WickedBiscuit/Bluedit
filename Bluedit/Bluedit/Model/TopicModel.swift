//
//  TopicModel.swift
//  Bluedit
//
//  Created by Marcus on 22/06/2024.
//

import ObjectMapper
import UIKit

struct TopicModel: Mappable {
    var groupImage: UIImage?
    var groupNameLabel: String?
    var posterUsername: String?
    var timePostedLabel: String?
    var topicTitleLabel: String?
    var topicPreviewLabel: String?
    var upvoteCounter: Int?
    
    var postedTimeStamp: TimeInterval?
    
    init(groupImage: UIImage?, groupNameLabel: String?, timePostedLabel: String?, topicTitleLabel: String?, topicPreviewLabel: String?, upvoteCounter: Int?, posterUsername: String) {
        self.groupImage = groupImage
        self.groupNameLabel = groupNameLabel
        self.timePostedLabel = timePostedLabel
        self.topicTitleLabel = topicTitleLabel
        self.topicPreviewLabel = topicPreviewLabel
        self.upvoteCounter = upvoteCounter
        self.posterUsername = posterUsername
    }
    
    init(groupImage: UIImage?, groupNameLabel: String?, timePostedLabel: String?, topicTitleLabel: String?, topicPreviewLabel: String?, upvoteCounter: Int?, posterUsername: String, timestamp: TimeInterval) {
        self.groupImage = groupImage
        self.groupNameLabel = groupNameLabel
        self.timePostedLabel = timePostedLabel
        self.topicTitleLabel = topicTitleLabel
        self.topicPreviewLabel = topicPreviewLabel
        self.upvoteCounter = upvoteCounter
        self.posterUsername = posterUsername
        self.postedTimeStamp = timestamp
    }
    
    init?(map: Map)
    {
        
    }
    
    mutating func mapping(map: Map)
    {
        groupImage <- map["groupImage"]
        groupNameLabel <- map["groupNameLabel"]
        timePostedLabel <- map["timePostedLabel"]
        topicTitleLabel <- map["topicTitleLabel"]
        topicPreviewLabel <- map["topicPreviewLabel"]
        upvoteCounter <- map["upvoteCounter"]
        posterUsername <- map["posterUsername"]
        postedTimeStamp <- map["postedTimeStamp"]
    }
}
