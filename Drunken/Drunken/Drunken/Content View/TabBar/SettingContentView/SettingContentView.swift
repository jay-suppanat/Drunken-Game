//
//  SettingContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import SwiftUI

struct SettingContentView: View {
    @StateObject var viewModel = SettingContentViewModel()

    var body: some View {
        NavigationStack {
            List(self.viewModel.settingMenu.list) { item in
                SettingCellView(id: item.id,
                                title: item.title,
                                image: item.image)
            }
        }
        .navigationTitle("Setting")
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: SettingCellView

struct SettingCellView: View {
    var id: Int
    var title: String
    var image: String

    var body: some View {
        HStack {
            Image(systemName: self.image)

            Text(self.title)
                .foregroundStyle(self.id == 2 ? .red : .black)

            Spacer()
        }
    }
}

#Preview {
    SettingContentView()
}
