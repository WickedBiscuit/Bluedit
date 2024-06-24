//
//  DataManager.swift
//  Bluedit
//
//  Created by Marcus on 23/06/2024.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    var topicsDataArray: [TopicModel] = []
    
    var counter: Int = 0
    
    private init() {}
    
    func sortTopicsByUpvote() {
        // Upvote counter in this scenario will not be null
        self.topicsDataArray.sort { $0.upvoteCounter! > $1.upvoteCounter! }
    }
}
