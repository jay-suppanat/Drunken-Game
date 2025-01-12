//
//  DrunkenClient.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import SwiftUI

class DrunkenClient: ObservableObject {
    public func fetchData<T: Decodable>(response: T.Type, completion: @escaping (Result<T, Error>) -> Void) {}

    public func fetchDataFromJSON<T: Decodable>(fileName: String, response: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let jsonFile = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("⚠️ \(fileName).json is not found.")
            return
        }

        do {
            let data = try JSONDecoder().decode(T.self, from: try Data(contentsOf: jsonFile))
            completion(data as! Result<T, any Error>)
        } catch {
            print("Failed to decode \(fileName).json: \(error.localizedDescription)")
        }
    }
}
