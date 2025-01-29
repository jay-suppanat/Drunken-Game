//
//  EditCommandViewModek.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import Foundation
import SwiftUI

class PunishmentListViewModel: ObservableObject {
    @Published public var commandListPublished: [(id: UUID, title: String, punishment: String)] = []
    @Published public var commandTitleListPublished: [String] = []

    init() {
        self.fetchPunishment()
    }
}

// MARK: Logic

extension PunishmentListViewModel: Logic {
    public func resetPunishment() {
        DrunkenUtil().resetPunishment()

        let title = Constants.Command.commandTitleArray
        self.commandListPublished = title.map({ title in
            let defaultPunishment = DrunkenUtil().getDefaultCommand(card: title)
            return (id: UUID(), title: title, punishment: defaultPunishment)
        })
    }

    public func fetchPunishment() {
        self.commandTitleListPublished = Constants.Command.commandTitleArray

        let title = Constants.Command.commandTitleArray
        self.commandListPublished = title.map({ title in
            let saved = DrunkenUtil().getPunishment(card: title)
            return (id: UUID(), title: title, punishment: saved)
        })
    }
}
