//
//  GameSession.swift
//  WWTBAB
//
//  Created by Lev Bazhkov on 26.08.2021.
//

import Foundation

final class GameSession: GameViewControllerDelegateFull {

    let allQuestions: Int
    var rightAnswers: Int
    var totalMoneyOwned: Decimal
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
    
    func didEndGame(with rightAnswers: Int, totalMoneyOwned: Decimal, isPeopleOpinionButtonUsed: Bool, isDeleteTwoWrongAnswersButtonUsed: Bool, isFriendHelpButtonUsed: Bool) {
        self.rightAnswers = rightAnswers
        self.totalMoneyOwned = totalMoneyOwned
        self.isPeopleOpinionButtonUsed = isPeopleOpinionButtonUsed
        self.isDeleteTwoWrongAnswersButtonUsed = isDeleteTwoWrongAnswersButtonUsed
        self.isFriendHelpButtonUsed = isFriendHelpButtonUsed
    }
}
