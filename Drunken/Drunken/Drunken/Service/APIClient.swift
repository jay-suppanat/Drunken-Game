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

    public func fetchDataFromJSON<T: Decodable>(fileName: String, response: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let jsonFile = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("⚠️ \(fileName).json is not found.")
            return
        }

        do {
            let data = try Data(contentsOf: jsonFile)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        } catch {
            print("⚠️ Failed to decode \(fileName).json: \(error.localizedDescription)")
            completion(.failure(error))
        }
    }
}

// MARK: DrunkenService

enum DrunkenService {
    static func fetchSettingMenuList(completion: @escaping (Result<SettingMenuListModel, Error>) -> Void) {
        APIClient.shared.fetchDataFromJSON(fileName: APIRouter.settingMenuList.jsonFile, response: SettingMenuListModel.self) { response in
            switch response {
                case .success(let data):
                    print("📦 Fetch setting menu list success.")
                    completion(.success(data))
                case .failure(let error):
                    print("⚠️ Fetch setting menu list failed: \(error.localizedDescription)")
                    completion(.failure(error))
            }
        }
    }
}
