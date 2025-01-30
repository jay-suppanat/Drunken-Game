//
//  AboutViewModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 31/1/2568 BE.
//

import Foundation

class AboutViewModel: ObservableObject {
    @Published private var aboutTextPublished: String = ""

    init() {
        self.aboutTextPublished = Constants.aboutText
    }
}

// MARK: Get

extension AboutViewModel: Get {
    public func getAboutText() -> String {
        return self.aboutTextPublished
    }
}
