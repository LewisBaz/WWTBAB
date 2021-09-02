//
//  SettingsViewController.swift
//  WWTBAB
//
//  Created by Lev Bazhkov on 30.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var sequenceOfQuestionsLabel: UILabel!
    @IBOutlet weak var sequenceOfQuestionsControlLabel: UISegmentedControl!
    @IBAction func sequenceOfQuestionsSegmentedControl(_ sender: UISegmentedControl) {
        guard let selectedSequence = Sequence(rawValue: sender.selectedSegmentIndex) else { return }
        Game.shared.sequence = selectedSequence
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: "chosenSequenceState")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let value = UserDefaults.standard.value(forKey: "chosenSequenceState"){
            let selectedIndex = value as! Int
            sequenceOfQuestionsControlLabel.selectedSegmentIndex = selectedIndex
        }
    }
}
