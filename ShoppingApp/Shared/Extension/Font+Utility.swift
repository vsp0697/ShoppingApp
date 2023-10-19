//
//  UIFont+Utility.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import Foundation
import SwiftUI
import UIKit
extension Font {
    enum WorkSans: String {
        case regular = "WorkSans-Regular"
        case italic = "WorkSans-Italic"
        case extraLight = "WorkSans-ExtraLight"
        case thin =  "WorkSans-Thin"
        case extraLightItalic = "WorkSans-ExtraLightItalic"
        case thinItalic = " WorkSans-ThinItalic"
        case light = "WorkSans-Light"
        case lightItalic = " WorkSans-LightItalic"
        case medium = "WorkSans-Medium"
        case mediumItalic = "WorkSans-MediumItalic"
        case SemiBold = "WorkSans-SemiBold"
        case SemiBoldItalic = "WorkSans-SemiBoldItalic"
        case bold = "WorkSans-Bold"
        case boldItalic = "WorkSans-BoldItalic"
        case extraBold = "WorkSans-ExtraBold"
        case extraBoldItalic = "WorkSans-ExtraBoldItalic"
        case black = "WorkSans-Black"
        case blackItalic = "WorkSans-BlackItalic"
        func forSize(_ size: FontSize) -> Font {
            return .custom(self.rawValue, size: size.rawValue)
        }
        func size(_ size: CGFloat) -> Font {
            return .custom(self.rawValue, size: size)
        }
    }
}
extension UIFont {
    enum WorkSans: String {
        case regular = "WorkSans-Regular"
        case italic = "WorkSans-Italic"
        case extraLight = "WorkSans-ExtraLight"
        case thin =  "WorkSans-Thin"
        case extraLightItalic = "WorkSans-ExtraLightItalic"
        case thinItalic = " WorkSans-ThinItalic"
        case light = "WorkSans-Light"
        case lightItalic = " WorkSans-LightItalic"
        case medium = "WorkSans-Medium"
        case mediumItalic = "WorkSans-MediumItalic"
        case SemiBold = "WorkSans-SemiBold"
        case SemiBoldItalic = "WorkSans-SemiBoldItalic"
        case bold = "WorkSans-Bold"
        case boldItalic = "WorkSans-BoldItalic"
        case extraBold = "WorkSans-ExtraBold"
        case extraBoldItalic = "WorkSans-ExtraBoldItalic"
        case black = "WorkSans-Black"
        case blackItalic = "WorkSans-BlackItalic"
        func forSize(_ size: FontSize) -> UIFont {
            return UIFont(name: self.rawValue, size: size.rawValue) ?? .systemFont(ofSize: size.rawValue)
        }
        func size(_ size: CGFloat) -> UIFont {
            return UIFont(name: self.rawValue, size: size) ?? .systemFont(ofSize: size)
        }
    }
}
enum FontSize: CGFloat {
    case ten = 10.0
    case twelve = 12.0
    case fourteen = 14.0
    case fifteen = 15.0
    case sixteen = 16.0
    case ninteen = 19.0
}
