//
//  BottleSpinViewModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 29/1/2568 BE.
//

import Foundation

class BottleSpinViewModel: ObservableObject {
    @Published private var rotationAnglePublished: Double = 0.00
    @Published private var isSpiningPublished: Bool = false

    init() {}
}

// MARK: Logic

extension BottleSpinViewModel: Logic {
    public func spinBottle() {
        self.isSpiningPublished.toggle()
        self.rotationAnglePublished += 4000
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.isSpiningPublished.toggle()
        }
    }
}

// MARK: Get

extension BottleSpinViewModel: Get {
    public func getIsSpiningStatus() -> Bool {
        return self.isSpiningPublished
    }

    public func getRotateAngle() -> Double {
        return self.rotationAnglePublished
    }
}
