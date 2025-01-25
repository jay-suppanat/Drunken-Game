//
//  GameContentViewModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import Foundation

class DoraemonGameViewModel: ObservableObject {
    @Published public var card: String = ""
    @Published public var isGameEnd: Bool = false
    @Published public var isCanEditCommand: Bool = true
    @Published public var isShowAlert: Bool = false

    init() {}

    var cardDeck = CardDeckModel(
        cardDeck: [
            "2", "22", "222", "2222",
            "3", "33", "333", "3333",
            "4", "44", "444", "4444",
            "5", "55", "555", "5555",
            "6", "66", "666", "6666",
            "7", "77", "777", "7777",
            "8", "88", "888", "8888",
            "9", "99", "999", "9999",
            "0", "00", "000", "0000",
            "J", "JJ", "JJJ", "JJJJ",
            "Q", "QQ", "QQQ", "QQQQ",
            "K", "KK", "KKK", "KKKK",
            "A", "AA", "AAA", "AAAA"

        ],
        kingCard: [
            "K", "KK", "KKK", "KKKK"
        ])
}

// MARK: Logic

extension DoraemonGameViewModel: Logic {
    public func randomCard() {
        self.isCanEditCommand = false

        if self.cardDeck.kingCard.isEmpty {
            self.isGameEnd = true
        } else {
            guard let index = (0..<self.cardDeck.cardDeck.count).randomElement() else { return }
            let randomCard = self.cardDeck.cardDeck[index]

            for (index, item) in self.cardDeck.kingCard.enumerated() {
                if item.lowercased() == randomCard.lowercased() {
                    self.cardDeck.kingCard.remove(at: index)
                }
            }

            self.cardDeck.cardDeck.remove(at: index)

            print("Remain Card: \(self.cardDeck.cardDeck.count)")
            print("Remain King Card: \(self.cardDeck.kingCard.count)")

            self.isGameEnd = false
            self.card = randomCard
        }
    }

    public func fillCard() {
        self.cardDeck.cardDeck = Constants.CardDeck.cards
        self.cardDeck.kingCard = Constants.CardDeck.kingCards

        print("Fill Card Deck: \(self.cardDeck.cardDeck.count)")
        print("Fill King Card: \(self.cardDeck.kingCard.count)")

        self.isCanEditCommand = true
        self.isShowAlert = false
        self.isGameEnd = false
    }

    public func getAnimationTime() -> TimeInterval {
        return 0.2
    }

    public func touchCancelAlertButton() {
        self.isGameEnd = false
        self.isShowAlert = false
    }

    public func touchResetButton() {
        self.isShowAlert = true
    }

    public func checkIsGameEnd() {
        if self.cardDeck.kingCard.isEmpty {
            self.isGameEnd = true
        } else {
            self.isGameEnd = false
        }
    }
}
