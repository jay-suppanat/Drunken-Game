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
