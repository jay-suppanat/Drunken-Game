//
//  DrunkenUtil.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

class DrunkenUtil {
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

    public func getPunishment(card: String) -> String {
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

    public func setPunishment(card: String, newCommand: String) {
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
}
