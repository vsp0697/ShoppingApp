//
//  ProductDescription.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import SwiftUI

struct ProductDescriptionView: View {
    @ObservedObject var viewModel: ProductDescriptionViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            VStack(alignment: .leading, spacing: 7) {
                HStack(spacing: 8) {
                    Text(viewModel.name)
                        .textViewStyle(.ninteen, style: .medium, color: .white)
                    Spacer()
                    Asset.share
                }
                HStack(spacing: 8) {
                    Text(viewModel.finalprice)
                        .textViewStyle(.fourteen, style: .medium, color: .appGreenShade1)
                    HStack(spacing: 5) {
                        Text(viewModel.originalPrice)
                            .strikethrough(true, color: .appGreyShade1)
                            .textViewStyle(.twelve, style: .medium, color: .appGreyShade1)
                        Text(viewModel.discount)
                            .textViewStyle(.twelve, style: .medium, color: .appGreyShade1)
                    }
                }
            }
            SepratorView()
            VStack(alignment: .leading, spacing: 9) {
                Text(viewModel.description)
                    .multilineTextAlignment(.leading)
                    .textViewStyle(.twelve, style: .regular, color: .white)
                Text(viewModel.readMore)
                    .textViewStyle(.twelve, style: .regular, color: .appProfileGradientDark)
            }
            SepratorView()
        }
    }
}
