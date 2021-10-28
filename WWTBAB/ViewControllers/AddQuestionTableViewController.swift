//
//  AddQuestionTableViewController.swift
//  WWTBAB
//
//  Created by Lev Bazhkov on 31.08.2021.
//

import UIKit

class AddQuestionTableViewController: UITableViewController, UITextFieldDelegate {
    
    var allQuestions = [Question]()
    var questionsToAppend = [Question]()
    let questionBuilder = QuestionBuilder()
    let answersForUser = ["Вопрос:", "Правильный ответ:", "Неправильный ответ 1:", "Неправильный ответ 2:", "Неправильный ответ 3:"]
    var answersFromUser = [String]()
    var smallArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddQuestionTableViewCell.reuseId, for: indexPath) as! AddQuestionTableViewCell
        cell.selectionStyle = .none
        switch indexPath.row {
        case 0,1,2,3:
            cell.labelText.text = answersForUser[indexPath.row]
            cell.textField.tag = indexPath.row
            cell.textField.addTarget(self, action: #selector(saveString), for: .editingDidEnd)
        case 4:
            cell.labelText.text = answersForUser[indexPath.row]
            cell.textField.tag = indexPath.row
            cell.textField.addTarget(self, action: #selector(makeArray), for: .editingChanged)
            cell.textField.delegate = self
        default:
            break
        }
        return cell
    }
    
    @objc func makeArray(_ sender: UITextField) {
        var value : String?
        let index = sender.tag
        let indexPath = IndexPath(row: index, section: 0)
        guard let cell = self.tableView.cellForRow(at: indexPath) as? AddQuestionTableViewCell else { return }
        
        if let text = cell.textField.text, !text.isEmpty {
            value = text
            smallArray.append(value ?? "")
        }
    }
    
    @objc func saveString(_ sender: UITextField) {
        var value : String?
        let index = sender.tag
        let indexPath = IndexPath(row: index, section: 0)
        guard let cell = self.tableView.cellForRow(at: indexPath) as? AddQuestionTableViewCell else { return }

        if let text = cell.textField.text, !text.isEmpty {
            value = text
            answersFromUser.append(value ?? "")
        }
    }
    
    func makeQuestion() -> Question {
        questionBuilder.setQuestion(answersFromUser[0])
        questionBuilder.setRightAnswer((true, answersFromUser[1]))
        questionBuilder.setWrongAnswers([(false, answersFromUser[2]), (false, answersFromUser[3]), (false, answersFromUser[4])])
        questionBuilder.setImage("https://gynek.ucoz.kz/_bl/0/93873469.jpg")
        return questionBuilder.build()
    }
    
    @IBAction func addQuestionButton(_ sender: UIButton) {
        
        sender.addTarget(self, action: #selector(clearTextFileds), for: .touchUpInside)
        answersFromUser.append(smallArray.last ?? "")
        if answersFromUser.count == 5 {
            let question = makeQuestion()
            questionsToAppend.append(question)
            answersFromUser.removeAll()
        } else {
            answersFromUser.removeAll()
            let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func clearTextFileds(_ sender: UITextField) {

        for i in 0...tableView.numberOfRows(inSection: 0) {
            guard let cell = self.tableView.cellForRow(at: IndexPath(row: i, section: 0)) as? AddQuestionTableViewCell else { return }
            if cell.textField.text != "" {
                cell.textField.text = ""
            }
        }
    }
    
    @IBAction func addAllQuestionsButton(_ sender: Any) {
        if questionsToAppend.isEmpty {
            let alert = UIAlertController(title: "Ошибка", message: "Вы не создали ни одного вопроса!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        } else {
            allQuestions.append(contentsOf: questionsToAppend)
            Question.allQuestons.append(contentsOf: allQuestions)
        }
    }
    
    @IBAction func exitButton(_ sender: Any) {
        answersFromUser.removeAll()
        self.dismiss(animated: true, completion: nil)
    }
}
