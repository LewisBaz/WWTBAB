//
//  GameSequenceStrategy.swift
//  WWTBAB
//
//  Created by Lev Bazhkov on 31.08.2021.
//

import Foundation

enum Sequence: Int {
    case oneByOne, random
}

protocol GameSequenceStrategy {
    func setSequence() -> [Question]
}

class GameSequenceOneByOne: GameSequenceStrategy {
    func setSequence() -> [Question] {
        let questions = Question.allQuestons
        return questions
    }
}

class GameSequenceRandom: GameSequenceStrategy {
    func setSequence() -> [Question] {
        var questions = Question.allQuestons
        questions.shuffle()
        return questions
    }
}
