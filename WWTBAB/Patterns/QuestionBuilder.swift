//
//  QuestionBuilder.swift
//  WWTBAB
//
//  Created by Lev Bazhkov on 31.08.2021.
//

import UIKit

class QuestionBuilder {
    
    private var question = String()
    private var rightAnswer: (Bool, String) = (true, "")
    private var wrongAnswers: [(Bool, String)] = [(false, "")]
    private var image =  String()
    
    func build() -> Question {
        return Question(question: question,
                        answerOne: rightAnswer,
                        answerTwo: wrongAnswers[0],
                        answerThree: wrongAnswers[1],
                        answerFour: wrongAnswers[2],
                        image: image)
    }
    
    func setQuestion(_ question: String) {
        self.question = question
    }
    
    func setRightAnswer(_ rightAnswer: (Bool, String)) {
        self.rightAnswer = rightAnswer
    }
    
    func setWrongAnswers(_ wrongAnswers: [(Bool, String)]) {
        self.wrongAnswers = wrongAnswers
    }
    
    func setImage(_ image: String) {
        self.image = image
    }
}
