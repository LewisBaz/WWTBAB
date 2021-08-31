//
//  StartViewController.swift
//  WWTBAB
//
//  Created by Lev Bazhkov on 25.08.2021.
//

import UIKit

class StartViewController: UIViewController, GameViewControllerDelegate {
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var lastResultLabel: UILabel!
    @IBAction func playButton(_ sender: Any) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination as? GameViewController else { return }
        destinationController.delegate = self
    }
    
    func didEndGame(with result: Int) {
        self.lastResultLabel.text = "Последний результат: \(result)"
    }
}
