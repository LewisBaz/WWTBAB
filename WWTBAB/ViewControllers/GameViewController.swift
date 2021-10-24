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

protocol GameViewControllerDelegateFull: AnyObject {
    func didEndGame(with rightAnswers: Int, totalMoneyOwned: Decimal, isPeopleOpinionButtonUsed: Bool, isDeleteTwoWrongAnswersButtonUsed: Bool, isFriendHelpButtonUsed: Bool)
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
    @IBOutlet weak var rightAnswersCountLabel: UILabel!
    
    weak var delegate: GameViewControllerDelegate?
    weak var delegateFull: GameViewControllerDelegateFull?
    let gameSession = GameSession()
    var sequence = Game.shared.sequence
    private var sequenceStrategy: GameSequenceStrategy {
        switch self.sequence {
        case .oneByOne:
            return GameSequenceOneByOne()
        case .random:
            return GameSequenceRandom()
        }
    }
    
    var questions = [Question]()
    var index = 0
    var allQuestionsCount = Question.allQuestons.count
    var rightAnswers = Observable<Int>(0)
    var isPeopleOpinionButtonUsed = false
    var isDeleteTwoWrongAnswersButtonUsed = false
    var isFriendHelpButtonUsed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = sequenceStrategy.setSequence()
        print(questions)
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
        
        setupQuestion(questions[index], controller: self)
        
        rightAnswers.addObserver(self, options: [.new, .initial], closure: { [weak self] (rightAnswers, _) in
            self?.rightAnswersCountLabel.text = "\(rightAnswers)/\(self?.allQuestionsCount ?? 10)"
            self?.rightAnswersCountLabel.backgroundColor = .systemIndigo
        })
    }
    
    @objc func checkAnswerOne(_ sender: UIButton) {
        if questions[index].answerOne.0 == true {
            UIView.animateKeyframes(withDuration: 0.5,
                                    delay: 0,
                                    animations: {
                                        self.answerOne.backgroundColor = .green
                                        self.answerOne.backgroundColor = .systemPurple
                                    },
                                    completion: { _ in
                                        self.index += 1
                                        self.rightAnswers.value += 1
                                        if self.index > self.allQuestionsCount - 1 {
                                            self.endGame()
                                        }
                                        self.setupQuestion(self.questions[self.index], controller: self)
                                    })
        } else {
            UIView.animateKeyframes(withDuration: 0.5,
                                    delay: 0,
                                    animations: {
                                        self.answerOne.backgroundColor = .red
                                        self.answerOne.backgroundColor = .systemPurple
                                    },
                                    completion: { _ in
                                        self.endGame()
                                    })
        }
    }
    @objc func checkAnswerTwo(_ sender: UIButton) {
        if questions[index].answerTwo.0 == true {
            UIView.animateKeyframes(withDuration: 0.5,
                                    delay: 0,
                                    animations: {
                                        self.answerTwo.backgroundColor = .green
                                        self.answerTwo.backgroundColor = .systemPurple
                                    },
                                    completion: { _ in
                                        self.index += 1
                                        self.rightAnswers.value += 1
                                        if self.index > self.allQuestionsCount - 1 {
                                            self.endGame()
                                        }
                                        self.setupQuestion(self.questions[self.index], controller: self)
                                    })
        } else {
            UIView.animateKeyframes(withDuration: 0.5,
                                    delay: 0,
                                    animations: {
                                        self.answerTwo.backgroundColor = .red
                                        self.answerTwo.backgroundColor = .systemPurple
                                    },
                                    completion: { _ in
                                        self.endGame()
                                    })
        }
    }
    @objc func checkAnswerThree(_ sender: UIButton) {
        if questions[index].answerThree.0 == true {
            UIView.animateKeyframes(withDuration: 0.5,
                                    delay: 0,
                                    animations: {
                                        self.answerThree.backgroundColor = .green
                                        self.answerThree.backgroundColor = .systemPurple
                                    },
                                    completion: { _ in
                                        self.index += 1
                                        self.rightAnswers.value += 1
                                        if self.index > self.allQuestionsCount - 1 {
                                            self.endGame()
                                        }
                                        self.setupQuestion(self.questions[self.index], controller: self)
                                    })
        } else {
            UIView.animateKeyframes(withDuration: 0.5,
                                    delay: 0,
                                    animations: {
                                        self.answerThree.backgroundColor = .red
                                        self.answerThree.backgroundColor = .systemPurple
                                    },
                                    completion: { _ in
                                        self.endGame()
                                    })
        }
    }
    @objc func checkAnswerFour(_ sender: UIButton) {
        if questions[index].answerFour.0 == true {
            UIView.animateKeyframes(withDuration: 0.5,
                                    delay: 0,
                                    animations: {
                                        self.answerFour.backgroundColor = .green
                                        self.answerFour.backgroundColor = .systemPurple
                                    },
                                    completion: { _ in
                                        self.index += 1
                                        self.rightAnswers.value += 1
                                        if self.index > self.allQuestionsCount - 1 {
                                            self.endGame()
                                        }
                                        self.setupQuestion(self.questions[self.index], controller: self)
                                    })
        } else {
            UIView.animateKeyframes(withDuration: 0.5,
                                    delay: 0,
                                    animations: {
                                        self.answerFour.backgroundColor = .red
                                        self.answerFour.backgroundColor = .systemPurple
                                    },
                                    completion: { _ in
                                        self.endGame()
                                    })
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
        self.isPeopleOpinionButtonUsed = true
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
        self.isDeleteTwoWrongAnswersButtonUsed = true
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
        self.isFriendHelpButtonUsed = true
        sender.isUserInteractionEnabled = false
        sender.backgroundColor = .gray
    }
    
    func endGame() {
        index = 0
        let totalMoneyOwned = pow(10, self.rightAnswers.value)
        self.delegate?.didEndGame(with: self.rightAnswers.value)
        self.delegateFull?.didEndGame(with: self.rightAnswers.value, totalMoneyOwned: totalMoneyOwned, isPeopleOpinionButtonUsed: self.isPeopleOpinionButtonUsed, isDeleteTwoWrongAnswersButtonUsed: self.isDeleteTwoWrongAnswersButtonUsed, isFriendHelpButtonUsed: self.isFriendHelpButtonUsed)
        
        let record = Record(date: Date(), allQuestions: allQuestionsCount, rightAnswers: rightAnswers.value, totalMoneyOwned: totalMoneyOwned, isPeopleOpinionButtonUsed: gameSession.isPeopleOpinionButtonUsed, isDeleteTwoWrongAnswersButtonUsed: gameSession.isDeleteTwoWrongAnswersButtonUsed, isFriendHelpButtonUsed: gameSession.isFriendHelpButtonUsed)
        Game.shared.addRecord(record)
        Game.shared.gameSession = nil
        self.dismiss(animated: true, completion: nil)
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
}


