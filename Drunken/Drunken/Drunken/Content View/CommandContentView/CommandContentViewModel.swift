//
//  CommandContentViewModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import Foundation

class CommandContentViewModel: ObservableObject {
    @Published var card: String

    init(card: String) {
        self.card = card
    }
}
