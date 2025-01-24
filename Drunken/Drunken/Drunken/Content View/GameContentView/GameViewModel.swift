//
//  GameContentViewModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import Foundation
import SwiftUI

// MARK: SideButtonMenuAction

enum SideMenuButtonAction {
    case setting
    case removeAds
    case info
    case noAction
}

// MARK: GameStatus

enum GameStatus {
    case start
    case end
}

class GameViewModel: ObservableObject {
    @Published private var cardPublished: String = ""
    @Published private var gameStatusPublished: GameStatus = .end
    @Published private var sideMenuActionPublished: SideMenuButtonAction = .noAction
    @Published private var showResetGameAlertPublished: Bool = false

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

extension GameViewModel: Logic {
    public func randomCard() {
        self.gameStatusPublished = .start

        if self.cardDeck.kingCard.isEmpty {
//            self.isShowAlert = true
            self.gameStatusPublished = .end
        } else {
            guard let index = (0..<self.cardDeck.cardDeck.count).randomElement() else { return }
            let randomCard = self.cardDeck.cardDeck[index]

            if self.cardDeck.kingCard.contains(randomCard) {
                self.cardDeck.kingCard.remove(at: 0)
            }

            self.cardDeck.cardDeck.remove(at: index)

            print("Remain Card Deck: \(self.cardDeck.cardDeck.count)")
            print("Remain King Card: \(self.cardDeck.kingCard.count)")

            self.cardPublished = randomCard
        }
    }

    public func fillCard() {
        self.cardDeck.cardDeck = Constants.CardDeck.cards
        self.cardDeck.kingCard = Constants.CardDeck.kingCards

        print("Fill Card Deck: \(self.cardDeck.cardDeck.count)")
        print("Fill King Card: \(self.cardDeck.kingCard.count)")

        self.showResetGameAlertPublished = false
        self.gameStatusPublished = .end
    }
}

// MARK: Get

extension GameViewModel: Get {
    public func getAnimationTime() -> TimeInterval {
        return 0.2
    }

    public func getGameStatus() -> GameStatus {
        return self.gameStatusPublished
    }

    public func getSideMenuAction() -> SideMenuButtonAction {
        return self.sideMenuActionPublished
    }

    public func getShowResetAlertStatus() -> Binding<Bool> {
        return Binding {
            self.showResetGameAlertPublished
        } set: { isShow in
            self.showResetGameAlertPublished = isShow
        }
    }

    public func getCard() -> String {
        return self.cardPublished
    }
}

// MARK: Action

extension GameViewModel: Action {
    public func touchCancelAlertButton() {
        self.showResetGameAlertPublished = false
    }

    public func touchResetButton() {
        self.showResetGameAlertPublished = true
    }
}
