//
//  DrunkenRouter.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

enum APIRouter: Routers {
    case settingMenuList
    case gameList

    var jsonFile: String {
        switch self {
        case .settingMenuList:
            return "setting_menu_list.json"
        case .gameList:
            return "game_list.json"
        }
    }
}
