//
//  EnvironmentManager.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 25/1/2568 BE.
//

import Foundation

class EnvironmentManager: ObservableObject {
    @Published public var isShowGameListMenu: Bool = true
    @Published public var gameSelectedIndex: Int = 0
}
