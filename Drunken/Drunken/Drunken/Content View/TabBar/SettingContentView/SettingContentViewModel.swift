//
//  SettingContentViewModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import Combine
import SwiftUI

class SettingContentViewModel: ObservableObject {
    @Published var settingMenu: SettingMenuListModel = .init()

    init() {
        self.fetchSettingMenu()
    }
}

// MARK: Service

extension SettingContentViewModel: Service {
    public func fetchSettingMenu() {
        DrunkenService.fetchSettingMenuList { response in
            self.settingMenu = response
        }
    }
}
