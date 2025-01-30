//
//  CardContentViewModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 30/1/2568 BE.
//

import Foundation

enum CardSide {
    case front
    case back
}

class CardViewModel: ObservableObject {
    @Published private var card: String
    @Published private var side: CardSide

    init(side: CardSide, card: String = "") {
        self.card = card
        self.side = side
    }
}

// MARK: Logic

extension CardViewModel: Logic {
    public func getCard() -> String {
        return self.card
    }

    public func getCardSide() -> CardSide {
        return self.side
    }
}
