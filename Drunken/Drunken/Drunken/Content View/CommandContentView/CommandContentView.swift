//
//  CommandContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import SwiftUI

struct CommandContentView: View {
    @State var cardNumber: String
    @Binding var isDismiss: Bool

    var body: some View {
        ZStack {
            Text("Your Card: \(self.cardNumber)")
                .foregroundStyle(Color.blue)

            Rectangle()
                .fill(Color.red)
                .containerRelativeFrame([.vertical, .horizontal])
                .onTapGesture {
                    self.isDismiss = false
                }
        }
    }
}

#Preview {
//    CommandContentView(cardNumber: "2")
}
