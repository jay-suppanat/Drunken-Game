//
//  SettingContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 31/1/2568 BE.
//

import SwiftUI

struct SettingContentView: View {
    @StateObject public var viewModel: SettingViewModel

    var body: some View {
        Text("Setting")
    }
}

#Preview {
    SettingContentView(viewModel: SettingViewModel())
}
