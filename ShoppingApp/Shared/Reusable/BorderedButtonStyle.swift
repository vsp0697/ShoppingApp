//
//  BorderButtonStyle.swift
//  ShoppingApp
//
//  Created by Nikita on 19/10/23.
//
import Foundation
import SwiftUI
struct BorderedButtonStyle: ButtonStyle {
    var selected: Bool
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(Color.appDarkGrey)
            .cornerRadius(4)
            .if(selected, transform: { view in
                view
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(LinearGradient(
                                colors: [.appProfileGradientDark, .appProfileGradientLight],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                                    , lineWidth: 1)
                    )
            })
    }
}
