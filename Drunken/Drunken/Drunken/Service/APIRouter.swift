//
//  DrunkenRouter.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

enum APIRouter: Routers {
    case menuList

    var jsonFile: String {
        switch self {
        case .menuList:
            return "menu_list.json"
        }
    }
}
