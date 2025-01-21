//
//  GameViewContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 19/1/2568 BE.
//

import SwiftUI

struct GameViewContentView: View {
    @State private var isOpen: Bool = false
    @State private var showCard = CardDeckManager.shared.randomCard()

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()

                ZStack {
                    Image(systemName: "pencil.circle.fill")
                        .frame(height: 50)
                }
            }

            Spacer()

            HStack {
                ZStack {
                    Image(self.isOpen ? self.showCard : "backCard")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .frame(width: 200, height: 300)
                        .aspectRatio(contentMode: .fill)


                    Button {
                        self.touchCardView()
                    } label: {}
                }
            }

            Spacer()
        }
    }

    private func touchCardView() {
        if self.isOpen {
            // Show command alert
        } else {
            // Show random card alert
        }

        self.isOpen.toggle()
    }

    private func touchRandomButton() {
        if self.isOpen {
            // Show back card
        } else {
            // Show front card
        }

        self.isOpen.toggle()
    }
}

#Preview {
    GameViewContentView()
}
