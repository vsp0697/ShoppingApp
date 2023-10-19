//
//  GradientTextView.swift
//  ShoppingApp
//
//  Created by Nikita on 19/10/23.
//

import Foundation
import SwiftUI

struct GradientTextView: View {
    var size: FontSize = .twelve
    var style: Font.WorkSans = .regular
    var text: String = ""
    var body: some View {
        LinearGradient(
            colors: [.appProfileGradientDark, .appProfileGradientLight],
            startPoint: .leading,
            endPoint: .trailing
        )
        .mask(
            HStack {
                Text(text)
                    .textViewStyle(size, style: .medium, color: .black)
                Spacer()
            }
        )
    }
}

struct GradientTextView_Previews: PreviewProvider {
    static var previews: some View {
        GradientTextView()
    }
}
