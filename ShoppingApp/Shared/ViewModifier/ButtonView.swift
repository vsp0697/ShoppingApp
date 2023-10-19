//
//  PrimaryButton.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import Foundation
import SwiftUI

struct PrimaryButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.WorkSans.regular.forSize(.fifteen))
            .multilineTextAlignment(.center)
            .foregroundColor(Color.black)
            .contentShape(Rectangle())
            .cornerRadius(4)
    }
}
struct SecondaryButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.WorkSans.regular.forSize(.fifteen))
            .multilineTextAlignment(.center)
            .foregroundColor(Color.appProfileGradientDark)
            .contentShape(Rectangle())
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(LinearGradient(
                        colors: [.appProfileGradientDark, .appProfileGradientLight],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                            , lineWidth: 1)
            )
    }
}
extension View {
    func primaryButtonStyle() -> some View {
        modifier(PrimaryButton())
    }
    func secondaryButtonStyle() -> some View {
        modifier(SecondaryButton())
    }
}
