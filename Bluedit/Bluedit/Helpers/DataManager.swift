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
}
