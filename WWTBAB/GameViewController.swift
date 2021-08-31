//
//  GameViewController.swift
//  WWTBAB
//
//  Created by Lev Bazhkov on 25.08.2021.
//

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func didEndGame(with result: Int)
}

class GameViewController: UIViewController {
    
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    @IBOutlet weak var peopleOpinionButton: UIButton!
    @IBOutlet weak var deleteTwoWrongAnswersButton: UIButton!
    @IBOutlet weak var friendHelpButton: UIButton!
    
    weak var delegate: GameViewControllerDelegate?
    let gameSession = GameSession()
    
    var questions = [questionOne, questionTwo, questionThree, questionFour, questionFive, questionSix, questionSeven, questionEight, questionNine, questionTen]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerOne.layer.cornerRadius = 10
        answerTwo.layer.cornerRadius = 10
        answerThree.layer.cornerRadius = 10
        answerFour.layer.cornerRadius = 10
        question.lineBreakMode = .byWordWrapping
        question.numberOfLines = 0
        questionImage.layer.cornerRadius = 10
        questionImage.contentMode = .scaleAspectFill
        answerOne.addTarget(self, action: #selector(checkAnswerOne), for: .touchUpInside)
        answerTwo.addTarget(self, action: #selector(checkAnswerTwo), for: .touchUpInside)
        answerThree.addTarget(self, action: #selector(checkAnswerThree), for: .touchUpInside)
        answerFour.addTarget(self, action: #selector(checkAnswerFour), for: .touchUpInside)
        peopleOpinionButton.layer.cornerRadius = 10
        deleteTwoWrongAnswersButton.layer.cornerRadius = 10
        friendHelpButton.layer.cornerRadius = 10
        peopleOpinionButton.addTarget(self, action: #selector(askPeopleOpinion), for: .touchUpInside)
        deleteTwoWrongAnswersButton.addTarget(self, action: #selector(deleteTwoWrongAnswers), for: .touchUpInside)
        friendHelpButton.addTarget(self, action: #selector(callFriend), for: .touchUpInside)
        
        Game.shared.gameSession = gameSession
        questions = [questionOne, questionTwo, questionThree, questionFour, questionFive, questionSix, questionSeven, questionEight, questionNine, questionTen]
        
        setupQuestion(questions[index], controller: self)
    }
    
    @objc func checkAnswerOne(_ sender: UIButton) {
        if questions[index].answerOne.0 == true {
            UIView.animate(withDuration: 0.5, animations: {
                self.answerOne.backgroundColor = .green
                self.answerOne.backgroundColor = .systemPurple
            })
            index += 1
            gameSession.rightAnswers += 1
            if index > 9 {
                endGame()
            }
            sleep(UInt32(0.5))
            setupQuestion(questions[index], controller: self)
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.answerOne.backgroundColor = .red
                self.answerOne.backgroundColor = .systemPurple
            })
            sleep(UInt32(0.5))
            endGame()
        }
    }
    @objc func checkAnswerTwo(_ sender: UIButton) {
        if questions[index].answerTwo.0 == true {
            UIView.animate(withDuration: 0.5, animations: {
                self.answerTwo.backgroundColor = .green
                self.answerTwo.backgroundColor = .systemPurple
            })
            index += 1
            gameSession.rightAnswers += 1
            if index > 9 {
                endGame()
            }
            sleep(UInt32(0.5))
            setupQuestion(questions[index], controller: self)
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.answerTwo.backgroundColor = .red
                self.answerTwo.backgroundColor = .systemPurple
            })
            sleep(UInt32(0.5))
            endGame()
        }
    }
    @objc func checkAnswerThree(_ sender: UIButton) {
        if questions[index].answerThree.0 == true {
            UIView.animate(withDuration: 0.5, animations: {
                self.answerThree.backgroundColor = .green
                self.answerThree.backgroundColor = .systemPurple
            })
            index += 1
            gameSession.rightAnswers += 1
            if index > 9 {
                endGame()
            }
            sleep(UInt32(0.5))
            setupQuestion(questions[index], controller: self)
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.answerThree.backgroundColor = .red
                self.answerThree.backgroundColor = .systemPurple
            })
            sleep(UInt32(0.5))
            endGame()
        }
    }
    @objc func checkAnswerFour(_ sender: UIButton) {
        if questions[index].answerFour.0 == true {
            UIView.animate(withDuration: 0.5, animations: {
                self.answerFour.backgroundColor = .green
                self.answerFour.backgroundColor = .systemPurple
            })
            index += 1
            gameSession.rightAnswers += 1
            if index > 9 {
                endGame()
            }
            sleep(UInt32(0.5))
            setupQuestion(questions[index], controller: self)
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.answerFour.backgroundColor = .red
                self.answerFour.backgroundColor = .systemPurple
            })
            sleep(UInt32(0.5))
            endGame()
        }
    }
    
    @objc func askPeopleOpinion(sender: UIButton) {
        let a = Int.random(in: 1...97)
        let b = Int.random(in: 1...98 - a)
        let c = Int.random(in: 1...99 - a - b)
        let d = 100 - a - b - c
        self.answerOne.setTitle("\(questions[index].answerOne.1) - \(a)%", for: .normal)
        self.answerTwo.setTitle("\(questions[index].answerTwo.1) - \(b)%", for: .normal)
        self.answerThree.setTitle("\(questions[index].answerThree.1) - \(c)%", for: .normal)
        self.answerFour.setTitle("\(questions[index].answerFour.1) - \(d)%", for: .normal)
        gameSession.isPeopleOpinionButtonUsed = true
        sender.isUserInteractionEnabled = false
        sender.backgroundColor = .gray
    }
    @objc func deleteTwoWrongAnswers(sender: UIButton) {
        let answers = [questions[index].answerOne, questions[index].answerTwo, questions[index].answerThree, questions[index].answerFour]
        var wrongAnswers = answers.filter({ $0.0 != true })
        let randomIndex = Int(arc4random_uniform(UInt32(wrongAnswers.count)))
        wrongAnswers.remove(at: randomIndex)
        if wrongAnswers[0].1 == answerOne.titleLabel?.text || wrongAnswers[1].1 == answerOne.titleLabel?.text {
            self.answerOne.alpha = 0
        }
        if wrongAnswers[0].1 == answerTwo.titleLabel?.text || wrongAnswers[1].1 == answerTwo.titleLabel?.text {
            self.answerTwo.alpha = 0
        }
        if wrongAnswers[0].1 == answerThree.titleLabel?.text || wrongAnswers[1].1 == answerThree.titleLabel?.text {
            self.answerThree.alpha = 0
        }
        if wrongAnswers[0].1 == answerFour.titleLabel?.text || wrongAnswers[1].1 == answerFour.titleLabel?.text {
            self.answerFour.alpha = 0
        }
        gameSession.isDeleteTwoWrongAnswersButtonUsed = true
        sender.isUserInteractionEnabled = false
        sender.backgroundColor = .gray
    }
    @objc func callFriend(sender: UIButton) {
        let answers = [questions[index].answerOne, questions[index].answerTwo, questions[index].answerThree, questions[index].answerFour]
        let randomIndex = Int(arc4random_uniform(UInt32(answers.count)))
        switch randomIndex {
        case 0:
            UIView.animate(withDuration: 2, animations: {
                self.answerOne.backgroundColor = .systemGreen
                self.answerOne.backgroundColor = .systemPurple
            })
        case 1:
            UIView.animate(withDuration: 2, animations: {
                self.answerTwo.backgroundColor = .systemGreen
                self.answerTwo.backgroundColor = .systemPurple
            })
        case 2:
            UIView.animate(withDuration: 2, animations: {
                self.answerThree.backgroundColor = .systemGreen
                self.answerThree.backgroundColor = .systemPurple
            })
        case 3:
            UIView.animate(withDuration: 2, animations: {
                self.answerFour.backgroundColor = .systemGreen
                self.answerFour.backgroundColor = .systemPurple
            })
        default:
            print("error")
        }
        gameSession.isFriendHelpButtonUsed = true
        sender.isUserInteractionEnabled = false
        sender.backgroundColor = .gray
    }
    
    func endGame() {
        index = 0
        self.delegate?.didEndGame(with: gameSession.rightAnswers)
        let rightAnswers = gameSession.rightAnswers
        var totalMoneyOwned = 0
        switch rightAnswers {
        case 1:
            totalMoneyOwned = questions[0].questionCost
        case 2:
            totalMoneyOwned = questions[1].questionCost
        case 3:
            totalMoneyOwned = questions[2].questionCost
        case 4:
            totalMoneyOwned = questions[3].questionCost
        case 5:
            totalMoneyOwned = questions[4].questionCost
        case 6:
            totalMoneyOwned = questions[5].questionCost
        case 7:
            totalMoneyOwned = questions[6].questionCost
        case 8:
            totalMoneyOwned = questions[7].questionCost
        case 9:
            totalMoneyOwned = questions[8].questionCost
        case 10:
            totalMoneyOwned = questions[9].questionCost
        default:
            totalMoneyOwned = 0
        }
        
        let record = Record(date: Date(), allQuestions: 10, rightAnswers: rightAnswers, totalMoneyOwned: totalMoneyOwned, isPeopleOpinionButtonUsed: gameSession.isPeopleOpinionButtonUsed, isDeleteTwoWrongAnswersButtonUsed: gameSession.isDeleteTwoWrongAnswersButtonUsed, isFriendHelpButtonUsed: gameSession.isFriendHelpButtonUsed)
        Game.shared.addRecord(record)
        self.dismiss(animated: true, completion: nil)
    }
}

func setupQuestion(_ question: Question, controller: GameViewController) {
    let url = URL(string: question.image)
    let data = try? Data(contentsOf: url!)
    controller.questionImage.image = UIImage(data: data!)
    controller.question.text = question.question
    controller.answerOne.setTitle(question.answerOne.1, for: .normal)
    controller.answerTwo.setTitle(question.answerTwo.1, for: .normal)
    controller.answerThree.setTitle(question.answerThree.1, for: .normal)
    controller.answerFour.setTitle(question.answerFour.1, for: .normal)
    controller.answerOne.alpha = 1
    controller.answerTwo.alpha = 1
    controller.answerThree.alpha = 1
    controller.answerFour.alpha = 1
}

