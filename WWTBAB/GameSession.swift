//
//  GameSession.swift
//  WWTBAB
//
//  Created by Lev Bazhkov on 26.08.2021.
//

import Foundation

final class GameSession {
    let allQuestions: Int
    var rightAnswers: Int
    var totalMoneyOwned: Int
    var isPeopleOpinionButtonUsed: Bool
    var isDeleteTwoWrongAnswersButtonUsed: Bool
    var isFriendHelpButtonUsed: Bool
    
    init() {
        allQuestions = 10
        rightAnswers = 0
        totalMoneyOwned = 0
        isPeopleOpinionButtonUsed = false
        isDeleteTwoWrongAnswersButtonUsed = false
        isFriendHelpButtonUsed = false
    }
}
