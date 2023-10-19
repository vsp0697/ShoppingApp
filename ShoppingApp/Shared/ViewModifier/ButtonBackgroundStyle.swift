//
//  BuutonBackgroundStyle.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import Foundation
import SwiftUI
struct BackgroundGradient: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.appProfileGradientDark, Color.appProfileGradientLight]),
                               startPoint: .leading, endPoint: .trailing)
            )
    }
}
extension View {
    func viewBackgroundGradientStyle() -> some View {
        modifier(BackgroundGradient())
    }
}
