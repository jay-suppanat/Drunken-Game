//
//  Untitled.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 23/1/2568 BE.
//

import SwiftUI

class AnimationBackgroundViewModel: ObservableObject {
    @Published public var gredientColorsPublished: [Color] = [Color.blackColor]
    @Published public var startingPointPublished: UnitPoint = UnitPoint.topLeading
    @Published public var endingPointPublished: UnitPoint = UnitPoint.bottomTrailing

    init(gredient: [Color], startingPoint: UnitPoint = .topLeading, endingPoint: UnitPoint = .bottomTrailing) {
        self.gredientColorsPublished = gredient
        self.startingPointPublished = startingPoint
        self.endingPointPublished = endingPoint
    }
}
