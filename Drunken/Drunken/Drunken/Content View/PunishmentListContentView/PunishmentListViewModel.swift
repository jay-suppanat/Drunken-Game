//
//  EditCommandViewModek.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import Foundation
import SwiftUI

class PunishmentListViewModel: ObservableObject {
    init() {}
}

// MARK: Logic

extension PunishmentListViewModel: Logic {
    public func resetPunishment() {
        DrunkenUtil().resetPunishment()
    }

    public func getPunishmentCount() -> Int {
        return Constants.Command.commandArray.count
    }

    public func getPunishmentTitleCount() -> Int {
        return Constants.Command.commandTitleArray.count
    }

    public func getPunishmentAtIndex(_ index: Int) -> String {
        return Constants.Command.commandArray[index]
    }

    public func getPunishmentTitleAtIndex(_ index: Int) -> String {
        return Constants.Command.commandTitleArray[index]
    }
}
