//
//  KeychainManager.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 24/1/2568 BE.
//

import Foundation
import Security

enum KaychainKey {
    static let isUserPurchased = "IS_USER_PURCHASED"
}

class KeychainManager {
    static let shared = KeychainManager()

    private init() {}
}

// MARK: Logic

extension KeychainManager: Logic {
    public func setKeychainValue(value: String, for key: String) {
        guard let valueData = value.data(using: .utf8) else { return }

        // Define the query
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: valueData,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
        ]

        // Delete any existing item with the same key
        SecItemDelete(query as CFDictionary)

        // Add the new item
        let status = SecItemAdd(query as CFDictionary, nil)
    }


    public func getKeychainValue(for key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        if status == errSecSuccess, let data = result as? Data {
            return String(data: data, encoding: .utf8)
        } else {
            return nil
        }
    }

    // Update value in Keychain
    public func update(value: String, for key: String) -> Bool {
        guard let valueData = value.data(using: .utf8) else { return false }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]

        let attributesToUpdate: [String: Any] = [
            kSecValueData as String: valueData
        ]

        let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
        return status == errSecSuccess
    }
}
