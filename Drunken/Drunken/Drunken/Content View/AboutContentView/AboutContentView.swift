//
//  AboutContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 31/1/2568 BE.
//

import SwiftUI

struct AboutContentView: View {
    @StateObject public var viewModel: AboutViewModel

    var body: some View {
        VStack {
            Text(self.viewModel.getAboutText())
                .font(.notoSan16)
                .foregroundStyle(Color.whiteColor)

            Spacer()
        }
        .padding(.top, 45)
        .padding()
    }
}

#Preview {
    AboutContentView(viewModel: AboutViewModel())
}
