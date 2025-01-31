//
//  String+Extension.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 31/1/2568 BE.
//

import SwiftUICore

extension String {
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
