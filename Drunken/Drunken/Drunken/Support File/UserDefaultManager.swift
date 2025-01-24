//
//  UserDefaultManager.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import Foundation

class UserDefaultManager {
    static let shared = UserDefaultManager()

    private let gameListKey = "GAME_LIST_KEY"
    private let command2Key = "COMMAND_2_KEY"
    private let command3Key = "COMMAND_3_KEY"
    private let command4Key = "COMMAND_4_KEY"
    private let command5Key = "COMMAND_5_KEY"
    private let command6Key = "COMMAND_6_KEY"
    private let command7Key = "COMMAND_7_KEY"
    private let command8Key = "COMMAND_8_KEY"
    private let command9Key = "COMMAND_9_KEY"
    private let command10Key = "COMMAND_10_KEY"
    private let commandJackKey = "COMMAND_JACK_KEY"
    private let commandQueenKey = "COMMAND_QUEEN_KEY"
    private let commandKingKey = "COMMAND_KING_KEY"
    private let commandAceKey = "COMMAND_ACE_KEY"

    private init() {}

    // MARK: Get-Set Game List

    public func setGameList(list: GameListModel) {
        do {
            let encodedData = try JSONEncoder().encode(list)
            UserDefaults.standard.set(encodedData, forKey: self.gameListKey)
        } catch {
            print("Failed to encode GameListModel: \(error)")
        }
    }

    public func getCommand2() -> GameListModel {
        guard let data = UserDefaults.standard.data(forKey: self.gameListKey) else {
            return GameListModel()
        }

        do {
            let decodedList = try JSONDecoder().decode(GameListModel.self, from: data)
            return decodedList
        } catch {
            print("Failed to decode GameListModel: \(error)")
            return GameListModel()
        }
    }

    // MARK: Get-Set Command 2

    public func setCommand2(command: String) {
        UserDefaults.standard.set(command, forKey: self.command2Key)
    }

    public func getCommand2() -> String {
        return UserDefaults.standard.object(forKey: self.command2Key) as? String ?? Constants.Command.command2
    }

    // MARK: Get-Set Command 3

    public func setCommand3(command: String) {
        UserDefaults.standard.set(command, forKey: self.command3Key)
    }

    public func getCommand3() -> String {
        return UserDefaults.standard.object(forKey: self.command3Key) as? String ?? Constants.Command.command3
    }

    // MARK: Get-Set Command 4

    public func setCommand4(command: String) {
        UserDefaults.standard.set(command, forKey: self.command4Key)
    }

    public func getCommand4() -> String {
        return UserDefaults.standard.object(forKey: self.command4Key) as? String ?? Constants.Command.command4
    }

    // MARK: Get-Set Command 5

    public func setCommand5(command: String) {
        UserDefaults.standard.set(command, forKey: self.command5Key)
    }

    public func getCommand5() -> String {
        return UserDefaults.standard.object(forKey: self.command5Key) as? String ?? Constants.Command.command5
    }

    // MARK: Get-Set Command 6

    public func setCommand6(command: String) {
        UserDefaults.standard.set(command, forKey: self.command6Key)
    }

    public func getCommand6() -> String {
        return UserDefaults.standard.object(forKey: self.command6Key) as? String ?? Constants.Command.command6
    }

    // MARK: Get-Set Command 7

    public func setCommand7(command: String) {
        UserDefaults.standard.set(command, forKey: self.command7Key)
    }

    public func getCommand7() -> String {
        return UserDefaults.standard.object(forKey: self.command7Key) as? String ?? Constants.Command.command7
    }

    // MARK: Get-Set Command 8

    public func setCommand8(command: String) {
        UserDefaults.standard.set(command, forKey: self.command8Key)
    }

    public func getCommand8() -> String {
        return UserDefaults.standard.object(forKey: self.command8Key) as? String ?? Constants.Command.command8
    }

    // MARK: Get-Set Command 9

    public func setCommand9(command: String) {
        UserDefaults.standard.set(command, forKey: self.command9Key)
    }

    public func getCommand9() -> String {
        return UserDefaults.standard.object(forKey: self.command9Key) as? String ?? Constants.Command.command9
    }

    // MARK: Get-Set Command 10

    public func setCommand10(command: String) {
        UserDefaults.standard.set(command, forKey: self.command10Key)
    }

    public func getCommand10() -> String {
        return UserDefaults.standard.object(forKey: self.command10Key) as? String ?? Constants.Command.command10
    }

    // MARK: Get-Set Command Jack

    public func setCommandJack(command: String) {
        UserDefaults.standard.set(command, forKey: self.commandJackKey)
    }

    public func getCommandJack() -> String {
        return UserDefaults.standard.object(forKey: self.commandJackKey) as? String ?? Constants.Command.commandJ
    }

    // MARK: Get-Set Command Queen

    public func setCommandQueen(command: String) {
        UserDefaults.standard.set(command, forKey: self.commandQueenKey)
    }

    public func getCommandQueen() -> String {
        return UserDefaults.standard.object(forKey: self.commandQueenKey) as? String ?? Constants.Command.commandQ
    }

    // MARK: Get-Set Command King

    public func setCommandKing(command: String) {
        UserDefaults.standard.set(command, forKey: self.commandKingKey)
    }

    public func getCommandKing() -> String {
        return UserDefaults.standard.object(forKey: self.commandKingKey) as? String ?? Constants.Command.commandK
    }

    // MARK: Get-Set Command Ace

    public func setCommandAce(command: String) {
        UserDefaults.standard.set(command, forKey: self.commandAceKey)
    }

    public func getCommandAce() -> String {
        return UserDefaults.standard.object(forKey: self.commandAceKey) as? String ?? Constants.Command.commandA
    }
}
