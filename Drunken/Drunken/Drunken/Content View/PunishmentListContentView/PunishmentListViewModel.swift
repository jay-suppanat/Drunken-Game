//
//  EditCommandViewModek.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import Foundation
import SwiftUI

class PunishmentListViewModel: ObservableObject {
    @Published public var allCommandPublished: [String] = []
    @Published public var allCommandTitlePublished: [String] = []

    init() {
        self.allCommandPublished = Constants.Command.commandArray
        self.allCommandTitlePublished = Constants.Command.commandTitleArray
    }
}

// MARK: Logic

extension PunishmentListViewModel: Logic {
    public func resetPunishment() {
        DrunkenUtil().resetPunishment()
    }

    public func getPunishmentCount() -> Int {
        return self.allCommandPublished.count
    }

    public func getPunishmentTitleCount() -> Int {
        return self.allCommandTitlePublished.count
    }

    public func getPunishmentAtIndex(_ index: Int) -> String {
        return self.allCommandPublished[index]
    }

    public func getPunishmentTitleAtIndex(_ index: Int) -> String {
        return self.allCommandTitlePublished[index]
    }
}
