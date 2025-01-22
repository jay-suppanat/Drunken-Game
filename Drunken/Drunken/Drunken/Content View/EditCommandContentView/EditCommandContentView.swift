//
//  EditCommandContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import SwiftUI

// MARK: EditCommandContentView

struct EditCommandContentView: View {
    @StateObject var viewModel: EditCommandViewModel
    @State private var isShowAlert: Bool = false

    var body: some View {
        VStack {
            List(0 ..< Constants.Command.commandArray.count) { index in
                EditCommandCell(card: Constants.Command.commandTitleArray[index], command: Constants.Command.commandArray[index])
            }

            Spacer()
        }
    }
}

// MARK: EditCommandCell

struct EditCommandCell: View {
    @State var card: String
    @State var command: String
    @State var isShowAlert: Bool = false
    @State var newCommand: String = ""

    var body: some View {
        Button {
            self.touchCell()
        } label: {
            Text("Card \(self.card)")
                .font(.subheadline)
                .frame(alignment: .leading)
                .tint(Color.textColor)
        }
        .fullScreenCover(isPresented: self.$isShowAlert) {
            if !self.newCommand.isEmpty {
                self.command = self.newCommand
            }
        } content: {
            EditCommandAlert(card: self.card, command: self.command, isShowAlret: self.$isShowAlert, newCommand: self.$newCommand)
        }
    }

    private func touchCell() {
        self.isShowAlert.toggle()
    }
}

// MARK: EditCommandAlert

struct EditCommandAlert: View {
    @State var card: String
    @State var command: String
    @Binding var isShowAlret: Bool
    @Binding var newCommand: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.whiteColor)

            VStack(spacing: 30) {
                Text(self.command)

                TextEditor(text: self.$newCommand)
                    .frame(height: 150)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                    .onAppear {
                        self.newCommand = ""
                    }

                HStack(spacing: 50) {
                    Spacer()

                    // Cancel Button
                    Button {
                        self.touchCancel()
                    } label: {
                        Text(Constants.Button.cancel)
                            .padding()
                            .tint(Color.textColor)
                    }
                    .background(Color.redColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                    // Submit Button
                    Button {
                        self.touchSubmit()
                    } label: {
                        Text(Constants.Button.submit)
                            .padding()
                            .tint(Color.textColor)
                    }
                    .background(Color.greenColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .disabled(!self.checkIsChangeCommand())

                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }

    private func touchCancel() {
        self.isShowAlret = false
    }

    private func touchSubmit() {
        if self.checkIsChangeCommand() {
            DrunkenUtil().setPunishment(card: self.card, newCommand: self.newCommand)
        }

        self.isShowAlret = false
    }

    private func checkIsChangeCommand() -> Bool {
        return !self.newCommand.isEmpty
    }
}

#Preview {
    EditCommandContentView(viewModel: EditCommandViewModel())
}
