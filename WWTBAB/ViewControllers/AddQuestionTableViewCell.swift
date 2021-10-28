//
//  AddQuestionTableViewCell.swift
//  WWTBAB
//
//  Created by Lev Bazhkov on 31.08.2021.
//

import UIKit

class AddQuestionTableViewCell: UITableViewCell {
    
    static let reuseId = "addQuestionCell"
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textField: UITextField!

    override func prepareForReuse() {
        textField = nil
    }
}
