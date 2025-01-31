//
//  SettingListCell.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 31/1/2568 BE.
//

import SwiftUI

struct SettingListCell: View {
    @StateObject public var viewModel: SettingListCellViewModel

    var body: some View {
        HStack {
            Text(self.viewModel.getSettingMenuData().menuName)
                .font(.lazyDog18)

            Toggle("", isOn: <#T##Binding<Bool>#>)
        }
    }
}

#Preview {
    SettingListCell(viewModel: SettingListCellViewModel(data: SettingMenuElement()))
}
