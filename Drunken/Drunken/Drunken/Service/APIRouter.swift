//
//  DrunkenRouter.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

enum APIRouter: Routers {
    case settingList
    case menuList

    var jsonFile: String {
        switch self {
        case .settingList:
            return "setting_list.json"
        case .menuList:
            return "menu_list.json"
        }
    }
}
