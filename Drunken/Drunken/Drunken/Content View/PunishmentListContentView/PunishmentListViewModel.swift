//
//  EditCommandViewModek.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import Foundation
import SwiftUI

class PunishmentListViewModel: ObservableObject {
    @Published private var commandListPublished: [String] = []
    @Published private var commandTitleListPublished: [String] = []

    init() {
        self.commandListPublished = Constants.Command.commandArray
        self.commandTitleListPublished = Constants.Command.commandTitleArray
    }
}

// MARK: Logic

extension PunishmentListViewModel: Logic {
    public func resetPunishment() {
        DrunkenUtil().resetPunishment()
        self.commandListPublished = Constants.Command.commandArray
    }

    public func getPunishmentCount() -> Int {
        return self.commandListPublished.count
    }

    public func getPunishmentTitleCount() -> Int {
        return self.commandTitleListPublished.count
    }

    public func getPunishmentAtIndex(_ index: Int) -> String {
        return self.commandListPublished[index]
    }

    public func getPunishmentTitleAtIndex(_ index: Int) -> String {
        return self.commandTitleListPublished[index]
    }
}
