//
//  Extension.swift
//  Bluedit
//
//  Created by Marcus on 22/06/2024.
//

import Foundation
import UIKit

extension UITableView
{
    // Assist in registering cells for the table view
    func registerTableViewCellFromNib(nibName: String)
    {
        return self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
}

extension UITableViewCell {

    // Assist in returning the identifier for the table view cells 
    class var cellIdentifier : String {
        return "\(self)"
    }

    static func uiNib() -> UINib {
        return UINib(nibName: "\(self)", bundle: nil)
    }
}
