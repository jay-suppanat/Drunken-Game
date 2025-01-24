//
//  DrunkenClient.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import SwiftUI

// MARK: APIClient

class APIClient: ObservableObject {
    static let shared = APIClient()

    public func fetchData<T: Decodable>(response: T.Type, completion: @escaping (Result<T, Error>) -> Void) {}

    public func fetchDataFromJSON<T: Decodable>(fileName: String, response: T.Type) -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Faliled to locate \(fileName) in bundle")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load file from \(fileName) from bundle")
        }

        let decoder = JSONDecoder()

        guard let loadedFile = try? decoder.decode(response, from: data) else {
            fatalError("Failed to decode \(fileName) from bundle")
        }

        return loadedFile
    }
}

// MARK: DrunkenService

enum DrunkenService {
    static func fetchSettingMenuList(completion: @escaping (SettingMenuListModel) -> Void) {
        completion(APIClient.shared.fetchDataFromJSON(fileName: APIRouter.settingMenuList.jsonFile, response: SettingMenuListModel.self))
    }

    static func fetchGameList() {
        UserDefaultManager.shared.setGameList(list: APIClient.shared.fetchDataFromJSON(fileName: APIRouter.gameList.jsonFile, response: GameListModel.self))
    }
}
