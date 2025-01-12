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
        DrunkenService.fetchSettingMenuList { response in
            switch response {
                case .success(let data):
                    print("📦 Fetch setting menu list success.")
                    self.settingMenu = data
                case .failure(let error):
                    print("⚠️ Fetch setting menu list failed: \(error.localizedDescription)")
            }
        }
    }
}
