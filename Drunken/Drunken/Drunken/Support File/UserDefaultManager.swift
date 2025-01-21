//
//  UserDefaultManager.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import Foundation

class UserDefaultManager {
    static let shared = UserDefaultManager()

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

    // MARK: Get-Set Command 2

    public func setCommand2Key(command: String) {
        UserDefaults.standard.set(command, forKey: self.command2Key)
    }

    public func getCommand2Key() -> String {
        return UserDefaults.standard.object(forKey: self.command2Key) as? String ?? Constants.Command.command2
    }

    // MARK: Get-Set Command 3

    public func setCommand3Key(command: String) {
        UserDefaults.standard.set(command, forKey: self.command3Key)
    }

    public func getCommand3Key() -> String {
        return UserDefaults.standard.object(forKey: self.command3Key) as? String ?? Constants.Command.command3
    }

    // MARK: Get-Set Command 4

    public func setCommand4Key(command: String) {
        UserDefaults.standard.set(command, forKey: self.command4Key)
    }

    public func getCommand4Key() -> String {
        return UserDefaults.standard.object(forKey: self.command4Key) as? String ?? Constants.Command.command4
    }

    // MARK: Get-Set Command 5

    public func setCommand5Key(command: String) {
        UserDefaults.standard.set(command, forKey: self.command5Key)
    }

    public func getCommand5Key() -> String {
        return UserDefaults.standard.object(forKey: self.command5Key) as? String ?? Constants.Command.command5
    }

    // MARK: Get-Set Command 6

    public func setCommand6Key(command: String) {
        UserDefaults.standard.set(command, forKey: self.command6Key)
    }

    public func getCommand6Key() -> String {
        return UserDefaults.standard.object(forKey: self.command6Key) as? String ?? Constants.Command.command6
    }

    // MARK: Get-Set Command 7

    public func setCommand7Key(command: String) {
        UserDefaults.standard.set(command, forKey: self.command7Key)
    }

    public func getCommand7Key() -> String {
        return UserDefaults.standard.object(forKey: self.command7Key) as? String ?? Constants.Command.command7
    }

    // MARK: Get-Set Command 8

    public func setCommand8Key(command: String) {
        UserDefaults.standard.set(command, forKey: self.command8Key)
    }

    public func getCommand8Key() -> String {
        return UserDefaults.standard.object(forKey: self.command8Key) as? String ?? Constants.Command.command8
    }

    // MARK: Get-Set Command 9

    public func setCommand9Key(command: String) {
        UserDefaults.standard.set(command, forKey: self.command9Key)
    }

    public func getCommand9Key() -> String {
        return UserDefaults.standard.object(forKey: self.command9Key) as? String ?? Constants.Command.command9
    }

    // MARK: Get-Set Command 10

    public func setCommand10Key(command: String) {
        UserDefaults.standard.set(command, forKey: self.command10Key)
    }

    public func getCommand10Key() -> String {
        return UserDefaults.standard.object(forKey: self.command10Key) as? String ?? Constants.Command.command10
    }

    // MARK: Get-Set Command Jack

    public func setCommandJackKey(command: String) {
        UserDefaults.standard.set(command, forKey: self.commandJackKey)
    }

    public func getCommandJackKey() -> String {
        return UserDefaults.standard.object(forKey: self.commandJackKey) as? String ?? Constants.Command.commandJ
    }

    // MARK: Get-Set Command Queen

    public func setCommandQueenKey(command: String) {
        UserDefaults.standard.set(command, forKey: self.commandQueenKey)
    }

    public func getCommandQueenKey() -> String {
        return UserDefaults.standard.object(forKey: self.commandQueenKey) as? String ?? Constants.Command.commandQ
    }

    // MARK: Get-Set Command King

    public func setCommandKingKey(command: String) {
        UserDefaults.standard.set(command, forKey: self.commandKingKey)
    }

    public func getCommandKingKey() -> String {
        return UserDefaults.standard.object(forKey: self.commandKingKey) as? String ?? Constants.Command.commandK
    }
}
