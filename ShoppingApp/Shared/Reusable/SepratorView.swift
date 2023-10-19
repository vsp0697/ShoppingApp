//
//  SepratorView.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//
import Foundation
import SwiftUI
struct SepratorView: View {
    var color: Color = .appDarkGrey
    var height: CGFloat = 1
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
    }
}
struct SepratorView_Previews: PreviewProvider {
    static var previews: some View {
        SepratorView()
    }
}
