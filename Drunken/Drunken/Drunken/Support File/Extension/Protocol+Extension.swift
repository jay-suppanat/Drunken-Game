//
//  Protocol+Extension.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

// MARK: Routers

protocol Routers {
    var jsonFile: String { get }
}

// MARK: Service

protocol Service {}

// MARK: Logic

protocol Logic {}

// MARK: Get

protocol Get {}

// MARK: AppUtil

protocol AppUtil {
    func getCardNumberText(card: String) -> String
    func getPunishment(card: String) -> String
    func setPunishment(card: String, newCommand: String)
    func resetPunishment()
}
