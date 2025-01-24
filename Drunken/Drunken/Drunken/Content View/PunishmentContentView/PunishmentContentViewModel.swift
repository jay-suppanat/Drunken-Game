//
//  CommandContentViewModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import Foundation

class PunishmentContentViewModel: ObservableObject {
    @Published private var cardPublished: String

    init(card: String) {
        self.cardPublished = card
    }
}

// MARK: Get

extension PunishmentContentViewModel: Get {
    public func getCard() -> String {
        return self.cardPublished
    }
}
