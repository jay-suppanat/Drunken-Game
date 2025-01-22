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
        ScrollView {
            NavigationView {
                VStack {
                    ForEach(self.viewModel.settingMenu.list) { item in
                        SettingCellView(id: item.id,
                                        title: item.title,
                                        image: item.image)
                        .padding(.horizontal)
                        .frame(height: 40)
                    }

                    Spacer()
                }
            }
        }
        .padding(.top, 10)
    }
}

// MARK: SettingCellView

struct SettingCellView: View {
    var id: Int
    var title: String
    var image: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.backgroundColor)

            HStack {
                Image(systemName: self.image)

                Text(self.title)
                    .foregroundStyle(self.id == 1 ? .red : .black)

                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SettingContentView()
}
