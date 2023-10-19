//
//  Color+AppColor.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import SwiftUI

extension Color {
    static var appBackGround: Color {
        return Color("AppBackGround")
    }
    static var appProfileGradientDark: Color {
        return Color("AppProfileGradientDark")
    }
    static var appProfileGradientLight: Color {
        return Color("AppProfileGradientLight")
    }
    static var appDarkGrey: Color {
        return Color("AppDarkGrey")
    }
    static var appGreyShade1: Color {
        return Color("AppGreyShade1")
    }
    static var appGreenShade1: Color {
        return Color("AppGreenShade1")
    }
    static var appGreyShade2: Color {
        return Color("AppGreyShade2")
    }
    static var appDarkGreen: Color {
        return Color("AppDarkGreen")
    }
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
