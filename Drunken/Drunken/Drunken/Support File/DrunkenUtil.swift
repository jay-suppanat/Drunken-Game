//
//  DrunkenUtil.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import Foundation
import SwiftUI

class DrunkenUtil: AppUtil {
    public func getCardNumberText(card: String) -> String {
        var numb = ""
        var suit = ""

        if let firstChar = card.first {
            numb = String(firstChar)
        }

        switch card.count {
        case 1:
            suit = "♣️"
        case 2:
            suit = "♦️"
        case 3:
            suit = "♥️"
        case 4:
            suit = "♠️"
        default:
            numb = ""
            suit = "[Fuckkkkkkkkkkkkkk, My app have bug.]"
        }

        return numb + suit
    }

    public func getCardNumberColor(card: String) -> Color {
        switch card.count {
        case 1, 4:
            return Color.blackColor
        case 2, 3:
            return Color.redColor
        default:
            return Color.whiteColor.opacity(0)
        }
    }

    public func getCardSuit(card: String) -> String {
        switch card.count {
        case 1:
            return "♣️"
        case 2:
            return "♦️"
        case 3:
            return "♥️"
        case 4:
            return "♠️"
        default:
            return "[Fuckkkkkkkkkkkkkk, My app have bug.]"
        }
    }

    public func getPunishment(card: String) -> String {
        print("Get Punishment")

        switch card {
        case let str where str.contains("2"):
            return UserDefaultManager.shared.getCommand2()
        case let str where str.contains("3"):
            return UserDefaultManager.shared.getCommand3()
        case let str where str.contains("4"):
            return UserDefaultManager.shared.getCommand4()
        case let str where str.contains("5"):
            return UserDefaultManager.shared.getCommand5()
        case let str where str.contains("6"):
            return UserDefaultManager.shared.getCommand6()
        case let str where str.contains("7"):
            return UserDefaultManager.shared.getCommand7()
        case let str where str.contains("8"):
            return UserDefaultManager.shared.getCommand8()
        case let str where str.contains("9"):
            return UserDefaultManager.shared.getCommand9()
        case let str where str.contains("0"):
            return UserDefaultManager.shared.getCommand10()
        case let str where str.contains("J"):
            return UserDefaultManager.shared.getCommandJack()
        case let str where str.contains("Q"):
            return UserDefaultManager.shared.getCommandQueen()
        case let str where str.contains("K"):
            return UserDefaultManager.shared.getCommandKing()
        case let str where str.contains("A"):
            return UserDefaultManager.shared.getCommandAce()
        default:
            return "[Fuckkkkkkkkkkkkkk, My app have bug.]"
        }
    }

    public func getDefaultCommand(card: String) -> String {
        switch card {
        case let str where str.contains("2"):
            return Constants.Command.command2
        case let str where str.contains("3"):
            return Constants.Command.command3
        case let str where str.contains("4"):
            return Constants.Command.command4
        case let str where str.contains("5"):
            return Constants.Command.command5
        case let str where str.contains("6"):
            return Constants.Command.command6
        case let str where str.contains("7"):
            return Constants.Command.command7
        case let str where str.contains("8"):
            return Constants.Command.command8
        case let str where str.contains("9"):
            return Constants.Command.command9
        case let str where str.contains("0"):
            return Constants.Command.command10
        case let str where str.contains("J"):
            return Constants.Command.commandJ
        case let str where str.contains("Q"):
            return Constants.Command.commandQ
        case let str where str.contains("K"):
            return Constants.Command.commandK
        case let str where str.contains("A"):
            return Constants.Command.commandA
        default:
            return "[Fuckkkkkkkkkkkkkk, My app have bug.]"
        }
    }

    public func setPunishment(card: String, newCommand: String) {
        print("Set Punishment")

        switch card {
        case let str where str.contains("2"):
            UserDefaultManager.shared.setCommand2(command: newCommand)
        case let str where str.contains("3"):
            UserDefaultManager.shared.setCommand3(command: newCommand)
        case let str where str.contains("4"):
            UserDefaultManager.shared.setCommand4(command: newCommand)
        case let str where str.contains("5"):
            UserDefaultManager.shared.setCommand5(command: newCommand)
        case let str where str.contains("6"):
            UserDefaultManager.shared.setCommand6(command: newCommand)
        case let str where str.contains("7"):
            UserDefaultManager.shared.setCommand7(command: newCommand)
        case let str where str.contains("8"):
            UserDefaultManager.shared.setCommand8(command: newCommand)
        case let str where str.contains("9"):
            UserDefaultManager.shared.setCommand9(command: newCommand)
        case let str where str.contains("0"):
            UserDefaultManager.shared.setCommand10(command: newCommand)
        case let str where str.contains("J"):
            UserDefaultManager.shared.setCommandJack(command: newCommand)
        case let str where str.contains("Q"):
            UserDefaultManager.shared.setCommandQueen(command: newCommand)
        case let str where str.contains("K"):
            UserDefaultManager.shared.setCommandKing(command: newCommand)
        case let str where str.contains("A"):
            UserDefaultManager.shared.setCommandAce(command: newCommand)
        default:
            print("[Fuckkkkkkkkkkkkkk, My app have bug.]")
        }
    }

    public func resetPunishment() {
        print("Reset Punishment")

        UserDefaultManager.shared.setCommand2(command: Constants.Command.command2)
        UserDefaultManager.shared.setCommand3(command: Constants.Command.command3)
        UserDefaultManager.shared.setCommand4(command: Constants.Command.command4)
        UserDefaultManager.shared.setCommand5(command: Constants.Command.command5)
        UserDefaultManager.shared.setCommand6(command: Constants.Command.command6)
        UserDefaultManager.shared.setCommand7(command: Constants.Command.command7)
        UserDefaultManager.shared.setCommand8(command: Constants.Command.command8)
        UserDefaultManager.shared.setCommand9(command: Constants.Command.command9)
        UserDefaultManager.shared.setCommand10(command: Constants.Command.command10)
        UserDefaultManager.shared.setCommandJack(command: Constants.Command.commandJ)
        UserDefaultManager.shared.setCommandQueen(command: Constants.Command.commandQ)
        UserDefaultManager.shared.setCommandKing(command: Constants.Command.commandK)
        UserDefaultManager.shared.setCommandAce(command: Constants.Command.commandA)
    }
}
