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
        
        // Total of 19 topics
        let topics: [TopicModel] = [
            TopicModel( groupImage: groupImage, groupNameLabel: "r/Swift", topicTitleLabel: "What's your favorite Swift feature?",topicPreviewLabel: "I'm curious to know what everyone's favorite feature of Swift is. Personally, I love the optionals and type safety it provides!", upvoteCounter: 10, posterUsername: "SwiftEnthusiast", timestamp: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/iOS",
                topicTitleLabel: "iOS App Development Tips",
                topicPreviewLabel: "Share your best tips and tricks for developing iOS apps efficiently. Let's learn from each other!",
                upvoteCounter: 15,
                posterUsername: "iOSDevMaster",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/Flutter",
                topicTitleLabel: "Custom Widgets Showcase",
                topicPreviewLabel: "Let's showcase some of the custom widgets you've built in Flutter! Share screenshots and code snippets.",
                upvoteCounter: 20,
                posterUsername: "FlutterDev",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/Programming",
                topicTitleLabel: "Best Practices in Object-Oriented Design",
                topicPreviewLabel: "Discuss the best practices you follow when designing object-oriented systems. What principles do you prioritize?",
                upvoteCounter: 30,
                posterUsername: "CodeCraft",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/GameDev",
                topicTitleLabel: "Game Development Tools Comparison",
                topicPreviewLabel: "Compare different game development tools and engines. Which one do you prefer and why?",
                upvoteCounter: 25,
                posterUsername: "GameMaster",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/AndroidDev",
                topicTitleLabel: "Kotlin vs Java in Android Development",
                topicPreviewLabel: "Debate the pros and cons of using Kotlin versus Java for Android app development. Which language do you prefer?",
                upvoteCounter: 18,
                posterUsername: "AndroidCoder",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/WebDev",
                topicTitleLabel: "Responsive Web Design Techniques",
                topicPreviewLabel: "Share tips on how to achieve responsive web design. What techniques and tools do you find most effective?",
                upvoteCounter: 22,
                posterUsername: "WebWizard",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/Python",
                topicTitleLabel: "Exploring Python's asyncio Module",
                topicPreviewLabel: "Dive into Python's asyncio module and its capabilities for concurrent programming. What are your experiences?",
                upvoteCounter: 12,
                posterUsername: "Pythonista",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/Java",
                topicTitleLabel: "Java 15 New Features Overview",
                topicPreviewLabel: "Discuss the new features introduced in Java 15. What improvements do they bring to Java development?",
                upvoteCounter: 28,
                posterUsername: "JavaDev",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/DataScience",
                topicTitleLabel: "Machine Learning Model Deployment Strategies",
                topicPreviewLabel: "Share strategies and best practices for deploying machine learning models into production environments.",
                upvoteCounter: 17,
                posterUsername: "DataScientist",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/CodingHelp",
                topicTitleLabel: "Debugging Techniques for Complex Codebases",
                topicPreviewLabel: "Discuss effective techniques and tools for debugging complex codebases. What methods do you use?",
                upvoteCounter: 19,
                posterUsername: "CodeHelper",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/UXDesign",
                topicTitleLabel: "Improving User Experience with Microinteractions",
                topicPreviewLabel: "Explore how microinteractions can enhance user experience in digital products. Share examples and case studies.",
                upvoteCounter: 14,
                posterUsername: "UXDesigner",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/DevOps",
                topicTitleLabel: "Continuous Integration and Deployment Tools Comparison",
                topicPreviewLabel: "Compare different CI/CD tools and platforms. Which ones have you found most effective for DevOps?",
                upvoteCounter: 23,
                posterUsername: "DevOpsEngineer",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/AI",
                topicTitleLabel: "Ethical Considerations in Artificial Intelligence",
                topicPreviewLabel: "Discuss ethical challenges and considerations in the development and deployment of AI technologies.",
                upvoteCounter: 16,
                posterUsername: "AIResearcher",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/Cybersecurity",
                topicTitleLabel: "Best Practices for Securing Web Applications",
                topicPreviewLabel: "Share best practices and strategies for securing web applications against cyber threats and attacks.",
                upvoteCounter: 26,
                posterUsername: "CyberSecExpert",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/Blockchain",
                topicTitleLabel: "Introduction to Decentralized Finance (DeFi)",
                topicPreviewLabel: "Learn about DeFi and its impact on traditional finance systems. Discuss decentralized applications and protocols.",
                upvoteCounter: 31,
                posterUsername: "BlockchainEnthusiast",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/SQL",
                topicTitleLabel: "Advanced SQL Query Optimization Techniques",
                topicPreviewLabel: "Explore advanced techniques for optimizing SQL queries to improve database performance and efficiency.",
                upvoteCounter: 21,
                posterUsername: "SQLWizard",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/CloudComputing",
                topicTitleLabel: "Serverless Architectures: Pros and Cons",
                topicPreviewLabel: "Discuss the advantages and challenges of serverless architectures in cloud computing. Share your experiences.",
                upvoteCounter: 24,
                posterUsername: "CloudArchitect",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
            TopicModel(
                groupImage: groupImage,
                groupNameLabel: "r/UIUX",
                topicTitleLabel: "Dark Mode Design Trends",
                topicPreviewLabel: "Explore current design trends and best practices for implementing dark mode in user interfaces.",
                upvoteCounter: 13,
                posterUsername: "UIDesigner",
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
            ),
//            TopicModel(
//                groupImage: groupImage,
//                groupNameLabel: "r/BigData",
//                topicTitleLabel: "Big Data Analytics Platforms Comparison",
//                topicPreviewLabel: "Compare different big data analytics platforms. Which ones are best suited for large-scale data processing?",
//                upvoteCounter: 29,
//                posterUsername: "BigDataAnalyst",
//                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
//            ),
//            TopicModel(
//                groupImage: groupImage,
//                groupNameLabel: "r/ArtificialIntelligence",
//                topicTitleLabel: "AI in Healthcare: Current Applications and Future Trends",
//                topicPreviewLabel: "Discuss the current applications of AI in healthcare and predict future trends in the field.",
//                upvoteCounter: 27,
//                posterUsername: "AIHealthcare",
//                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
//            ),
//            TopicModel(
//                groupImage: groupImage,
//                groupNameLabel: "r/ReactJS",
//                topicTitleLabel: "React Hooks vs Class Components",
//                topicPreviewLabel: "Compare React Hooks and class components in terms of performance, readability, and maintainability.",
//                upvoteCounter: 11,
//                posterUsername: "ReactDeveloper",
//                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
//            ),
//            TopicModel(
//                groupImage: groupImage,
//                groupNameLabel: "r/Linux",
//                topicTitleLabel: "Linux Distributions Comparison",
//                topicPreviewLabel: "Compare different Linux distributions. Which one do you prefer for development and why?",
//                upvoteCounter: 18,
//                posterUsername: "LinuxEnthusiast",
//                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
//            )
        ]
        
        dataArray = topics
        
        DataManager.shared.topicsDataArray = topics
        DataManager.shared.sortTopicsByUpvote()
        self.reloadTableView?()

    }
}
