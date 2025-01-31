//
//  DiceRollViewModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 31/1/2568 BE.
//

import Foundation

class DiceRollViewModel: ObservableObject {
    @Published private var diceFacePublished: DiceModel
    @Published private var isRollDicePublished: Bool = false

    init() {
        self.diceFacePublished = DiceModel(diceOne: 1, diceTwo: 6, punishment: "")
    }
}

// MARK: Logic

extension DiceRollViewModel: Logic {
    public func randomDice() {
        let diceOne: Int = Int.random(in: 1...6)
        let diceTwo: Int = Int.random(in: 1...6)
        print("Dice 1: \(diceOne)")
        print("Dice 2: \(diceTwo)")
        self.diceFacePublished = DiceModel(diceOne: diceOne,
                                           diceTwo: diceTwo,
                                           punishment: DrunkenUtil().getDiceRollPunishment(diceOne: diceOne, diceTwo: diceTwo))
    }

    public func toggleIsRollDice() {
        self.isRollDicePublished = true
    }
}

// MARK: Get

extension DiceRollViewModel: Get {
    public func getDiceFace() -> DiceModel {
        return self.diceFacePublished
    }

    public func isRollDice() -> Bool {
        return self.isRollDicePublished
    }
}
