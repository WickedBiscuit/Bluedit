//
//  AddPostViewController.swift
//  Bluedit
//
//  Created by Marcus on 24/06/2024.
//

import UIKit

class AddPostViewController: UIViewController {
    var isTitleTextViewEmpty: Bool = true
    var isBodyTextViewEmpty: Bool = true
    
    var addPostView: AddPostView {
        return view as! AddPostView
    }
    var viewModel: AddPostViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBindings()
    }
    
    func setupBindings() {
        // Setup the delegates for the text view
        self.addPostView.titleTextView.delegate = self
        self.addPostView.bodyTextView.delegate = self
        
        self.addPostView.closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        self.addPostView.nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
    }
    
    @objc func closeButtonPressed()
    {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonPressed()
    {
        // Unfocus all text views
        self.addPostView.bodyTextView.resignFirstResponder()
        self.addPostView.titleTextView.resignFirstResponder()
        
        if(self.isTitleTextViewEmpty) {
            let alert = UIAlertController(title: "Where is the title?", message: "Title cannot be empty for your new post.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            // For now it will operate as a post button , normal reddit procedure is to move to community selection screen
            // Default some of the variables including upvote that usually includes 1 auto upvote from the poster
            // Set an empty body if its still at the placeholder text
            
            let newTopic = TopicModel(groupImage: UIImage(named: "TempCommunityIcon"), groupNameLabel: "r/WorldNews", topicTitleLabel: self.addPostView.titleTextView.text, topicPreviewLabel: self.isBodyTextViewEmpty ? "" : self.addPostView.bodyTextView.text, upvoteCounter: 1, posterUsername: "MikeWalzowski", timestamp: Date())
            
            DataManager.shared.topicsDataArray.append(newTopic)
            navigationController?.popViewController(animated: true)
        }
        
    }
    
}

extension AddPostViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        return numberOfChars < 255
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == self.addPostView.titleTextView && self.isTitleTextViewEmpty {
            self.addPostView.titleTextView.text = ""
            self.addPostView.titleTextView.textColor = UIColor.black
        } else if textView == self.addPostView.bodyTextView && self.isBodyTextViewEmpty {
            self.addPostView.bodyTextView.text = ""
            self.addPostView.bodyTextView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == self.addPostView.titleTextView {
            if self.addPostView.titleTextView.text.isEmpty {
                self.addPostView.titleTextView.text = "Title"
                self.addPostView.titleTextView.textColor = UIColor.gray
                self.isTitleTextViewEmpty = true
            } else {
                self.addPostView.titleTextView.textColor = UIColor.black
                self.isTitleTextViewEmpty = false
            }
        }
        
        if textView == self.addPostView.bodyTextView {
            if self.addPostView.bodyTextView.text.isEmpty {
                self.addPostView.bodyTextView.text = "body text (optional)"
                self.addPostView.bodyTextView.textColor = UIColor.gray
                self.isBodyTextViewEmpty = true
            } else {
                self.addPostView.bodyTextView.textColor = UIColor.black
                self.isBodyTextViewEmpty = false
            }
        }
    }
}
