//
//  ResultsTableViewController.swift
//  WWTBAB
//
//  Created by Lev Bazhkov on 26.08.2021.
//

import UIKit

class ResultsTableViewController: UITableViewController {
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        tableView.backgroundColor = .systemIndigo
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath)
        cell.backgroundColor = .systemPurple
        
        let record = Game.shared.records[indexPath.row]
        cell.textLabel?.text = self.dateFormatter.string(from: record.date)
        cell.detailTextLabel?.text = "\(record.totalMoneyOwned)$, \(record.rightAnswers)/\(record.allQuestions)"

        return cell
    }    
}
