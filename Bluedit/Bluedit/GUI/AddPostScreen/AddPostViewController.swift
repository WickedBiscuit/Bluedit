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
        navigationController?.navigationBar.isHidden = true
        
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
        print("Next please")
    }
    
}

extension AddPostViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(textView == self.addPostView.titleTextView && self.isBodyTextViewEmpty) {
           self.addPostView.titleTextView.text = ""
        } else if (textView == self.addPostView.bodyTextView && self.isTitleTextViewEmpty) {
            self.addPostView.bodyTextView.text = ""
        }
        
    }
        
    func textViewDidEndEditing(_ textView: UITextView) {
        if(self.addPostView.titleTextView.text.count == 0) {
            self.addPostView.titleTextView.text = "Title"
            self.addPostView.titleTextView.textColor = UIColor.gray
            self.isTitleTextViewEmpty = true
        } else {
            self.addPostView.titleTextView.textColor = UIColor.black
            self.isTitleTextViewEmpty = false
        }
        
        if(self.addPostView.bodyTextView.text.count == 0) {
            self.addPostView.bodyTextView.text = "body text (optional)"
            self.addPostView.bodyTextView.textColor = UIColor.gray
            self.isBodyTextViewEmpty = true
        } else {
            self.addPostView.bodyTextView.textColor = UIColor.black
            self.isBodyTextViewEmpty = false
        }
    }
}
