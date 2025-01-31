//
//  DiceModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 31/1/2568 BE.
//

import Foundation

struct DiceModel: Identifiable, Codable {
    var id = UUID()
    var diceOne: Int
    var diceTwo: Int
    var punishment: String

    init(id: UUID = UUID(), diceOne: Int, diceTwo: Int, punishment: String) {
        self.id = id
        self.diceOne = diceOne
        self.diceTwo = diceTwo
        self.punishment = punishment
    }
}
