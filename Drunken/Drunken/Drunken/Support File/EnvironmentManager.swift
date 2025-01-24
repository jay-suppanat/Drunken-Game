//
//  EnvironmentManager.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 25/1/2568 BE.
//

import Foundation

class EnvironmentManager: ObservableObject {
    @Published public var isShowMenuList: Bool = true
    @Published public var menuSelectedIndex: Int = 1
}
