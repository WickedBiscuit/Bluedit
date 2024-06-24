//
//  BlueditTests.swift
//  BlueditTests
//
//  Created by Marcus on 19/06/2024.
//

import XCTest
@testable import Bluedit

final class BlueditTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_TopicModelInitialization() throws {
        // Test case to verify TopicModel initialization

        let groupImage = UIImage(named: "TempCommunityIcon")!
        let groupName = "r/Swift"
        let topicTitle = "What's your favorite Swift feature?"
        let topicPreview = "I'm curious to know what everyone's favorite feature of Swift is."
        let upvotes = 10
        let poster = "SwiftEnthusiast"
        let timestamp = Date()

        let topic = TopicModel(groupImage: groupImage, groupNameLabel: groupName, topicTitleLabel: topicTitle, topicPreviewLabel: topicPreview, upvoteCounter: upvotes, posterUsername: poster, timestamp: timestamp)

        XCTAssertEqual(topic.groupNameLabel, groupName)
        XCTAssertEqual(topic.topicTitleLabel, topicTitle)
        XCTAssertEqual(topic.topicPreviewLabel, topicPreview)
        XCTAssertEqual(topic.upvoteCounter, upvotes)
        XCTAssertEqual(topic.posterUsername, poster)
        XCTAssertEqual(topic.postedTimeStamp, timestamp)
    }

    func test_TestTopicSortingMethod() throws {
        //Test case to verify the sorting method
        
        let topics: [TopicModel] = [
            TopicModel(groupImage: UIImage(named: "TempCommunityIcon")!, groupNameLabel: "Test1", topicTitleLabel: "Test1", topicPreviewLabel: "Test1", upvoteCounter: 20, posterUsername: "Roger", timestamp: Date()),
            TopicModel(groupImage: UIImage(named: "TempCommunityIcon")!, groupNameLabel: "Test2", topicTitleLabel: "Test2", topicPreviewLabel: "Test2", upvoteCounter: 24, posterUsername: "Roger", timestamp: Date()),
            TopicModel(groupImage: UIImage(named: "TempCommunityIcon")!, groupNameLabel: "Test3", topicTitleLabel: "Test3", topicPreviewLabel: "Test3", upvoteCounter: 19, posterUsername: "Roger", timestamp: Date()),
            TopicModel(groupImage: UIImage(named: "TempCommunityIcon")!, groupNameLabel: "Test4", topicTitleLabel: "Test4", topicPreviewLabel: "Test4", upvoteCounter: 30, posterUsername: "Roger", timestamp: Date()),
            TopicModel(groupImage: UIImage(named: "TempCommunityIcon")!, groupNameLabel: "Test5", topicTitleLabel: "Test5", topicPreviewLabel: "Test5", upvoteCounter: 10, posterUsername: "Roger", timestamp: Date()),]
        DataManager.shared.topicsDataArray = topics
        
        DataManager.shared.sortTopicsByUpvote()
        
        XCTAssertEqual(DataManager.shared.topicsDataArray[0].topicTitleLabel, "Test4")
        XCTAssertEqual(DataManager.shared.topicsDataArray[1].topicTitleLabel, "Test2")
        XCTAssertEqual(DataManager.shared.topicsDataArray[2].topicTitleLabel, "Test1")
        XCTAssertEqual(DataManager.shared.topicsDataArray[3].topicTitleLabel, "Test3")
        XCTAssertEqual(DataManager.shared.topicsDataArray[4].topicTitleLabel, "Test5")
    }

}
