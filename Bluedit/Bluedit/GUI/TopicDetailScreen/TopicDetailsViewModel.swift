//
//  TopicDetailsViewModel.swift
//  Bluedit
//
//  Created by Marcus on 23/06/2024.
//

class TopicDetailsViewModel: TopicDetailsViewModelProtocol {
    weak var delegate : TopicDetailsViewModelDelegate?
    
    var topicModel: TopicModel?
    var index: Int?
    
    var reloadTableView: (()->())?
}
