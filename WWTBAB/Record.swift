//
//  Record.swift
//  WWTBAB
//
//  Created by Lev Bazhkov on 26.08.2021.
//

import Foundation

struct Record: Codable {
    let date: Date
    let allQuestions: Int
    let rightAnswers: Int
    let totalMoneyOwned: Int
    let isPeopleOpinionButtonUsed: Bool
    let isDeleteTwoWrongAnswersButtonUsed: Bool
    let isFriendHelpButtonUsed: Bool
}

final class RecordSaver {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "records"
    
    func saveRecord(records: [Record]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func recieveRecord() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try self.decoder.decode([Record].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
