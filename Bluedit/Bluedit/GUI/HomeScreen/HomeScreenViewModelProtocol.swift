//
//  HomeScreenViewModelProtocol.swift
//  Bluedit
//
//  Created by Marcus on 21/06/2024.
//

import Foundation


protocol HomeScreenViewModelProtocol {
    
}

protocol HomeScreenViewModelDelegate: AnyObject {
    func directToTopicDetails(model: TopicModel, index: Int)
    func directToAddPost()
}
