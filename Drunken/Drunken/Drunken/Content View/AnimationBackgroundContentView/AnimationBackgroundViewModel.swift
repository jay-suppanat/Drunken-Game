//
//  Untitled.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 23/1/2568 BE.
//

import SwiftUI

class AnimationBackgroundViewModel: ObservableObject {
    @Published private var gredientColorsPublished: [Color] = [Color.blackColor]
    @Published private var startingPointPublished: UnitPoint = UnitPoint.topLeading
    @Published private var endingPointPublished: UnitPoint = UnitPoint.bottomTrailing

    init(gredient: [Color], startingPoint: UnitPoint = .topLeading, endingPoint: UnitPoint = .bottomTrailing) {
        self.gredientColorsPublished = gredient
        self.startingPointPublished = startingPoint
        self.endingPointPublished = endingPoint
    }
}

// MARK: Logic

extension AnimationBackgroundViewModel: Logic {
    public func getColorArray() -> [Color] {
        return self.gredientColorsPublished
    }

    public func getStartingPoint() -> UnitPoint {
        return self.startingPointPublished
    }

    public func getEndingPoint() -> UnitPoint {
        return self.endingPointPublished
    }
}
