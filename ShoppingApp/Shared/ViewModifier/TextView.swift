//
//  TextView.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import Foundation
import SwiftUI

struct TextViewModifier: ViewModifier {
    var size: FontSize = .sixteen
    var style: Font.WorkSans = .regular
    var color: Color = .white
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .foregroundColor(color)
            .font(style.forSize(size))
    }
}
extension View {
    func textViewStyle(_ size: FontSize, style: Font.WorkSans, color: Color) -> some View {
        modifier(TextViewModifier(size: size, style: style, color: color))
    }
}
