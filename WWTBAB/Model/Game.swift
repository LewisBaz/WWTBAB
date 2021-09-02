//
//  Game.swift
//  WWTBAB
//
//  Created by Lev Bazhkov on 26.08.2021.
//

import Foundation

final class Game {
    
    static let shared = Game()
    private(set) var records: [Record] {
        didSet {
            recordSaver.saveRecord(records: self.records)
        }
    }
    var gameSession: GameSession?
    let recordSaver = RecordSaver()
    private init() {
        self.records = recordSaver.recieveRecord()
    }
    var sequence: Sequence = .oneByOne
        
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
        
    func clearRecords() {
        self.records = []
    }
}
