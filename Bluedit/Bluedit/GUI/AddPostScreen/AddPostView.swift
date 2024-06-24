//
//  AddPostView.swift
//  Bluedit
//
//  Created by Marcus on 24/06/2024.
//

import UIKit

class AddPostView: UIView {
    
    @IBOutlet weak var titleTextView: UITextView!{
        didSet {
            // Set placeholder text
            titleTextView.text = "Title"
            titleTextView.textColor = UIColor.gray
            titleTextView.font =  UIFont.boldSystemFont(ofSize: (titleTextView.font?.pointSize ?? UIFont.systemFontSize) + 5)
        }
    }
    
    @IBOutlet weak var bodyTextView: UITextView!{
        didSet {
            // Set placeholder text
            bodyTextView.textColor = UIColor.gray
            bodyTextView.text = "body text (optional)"
        }
    }
   
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
}
