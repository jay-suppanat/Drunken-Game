//
//  CardDeckModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import Foundation

// MARK: CardDeckModel

struct CardDeckModel {
  var cardDeck: [String]
  var kingCard: [String]

  init(cardDeck: [String], kingCard: [String]) {
    self.cardDeck = cardDeck
    self.kingCard = kingCard
  }
}

// MARK: CardDeckManager

class CardDeckManager {
    static let shared = CardDeckManager()

    var cardDeck = CardDeckModel(cardDeck: [
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
    ], kingCard: ["K", "KK", "KKK", "KKKK"])
}

// MARK: Logic

extension CardDeckManager: Logic {
    public func randomCard() -> String {
        if self.cardDeck.kingCard.isEmpty {
            return ""
        } else {
            guard let index = (0..<self.cardDeck.cardDeck.count).randomElement() else { return "Error Random Card" }
            let randomCard = self.cardDeck.cardDeck[index]

            if self.cardDeck.kingCard.contains(randomCard) {
                self.cardDeck.kingCard.remove(at: 0)
            }

            self.cardDeck.cardDeck.remove(at: index)

            return randomCard
        }
    }

    public func fillCard() {
        self.cardDeck.cardDeck = Constants.CardDeck.cards
        self.cardDeck.kingCard = Constants.CardDeck.kingCards
    }
}
