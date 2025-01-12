//
//  SettingContentViewModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import SwiftUI

class SettingContentViewModel: ObservableObject {
    @Published var settingMenu: SettingMenuListModel = .init()

    public func fetchSettingMenu() {
        
    }
}
