//
//  Colors+Extension.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 14/1/2568 BE.
//

import Foundation
import SwiftUI

// MARK: Color

extension Color {
    static let backgroundColor = Color(uiColor: UIColor(named: "background_color")!)
    static let textColor = Color("default_text_color")
    static let blackColor = Color("black_color")
    static let whiteColor = Color("white_color")
    static let redColor = Color("red_color")
    static let greenColor = Color("green_color")
    static let navigationBackgroundColor = Color("tab_bar_color")
    static let yellowColor = Color("yellow_color")
}

// MARK: UIColor

extension UIColor {
    static let tabBarBackgroundColor = UIColor(named: "tab_bar_color")
    static let unselectedTabBarColor = UIColor(named: "light_gray_color")
}
