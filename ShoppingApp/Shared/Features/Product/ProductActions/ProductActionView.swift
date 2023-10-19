//
//  ProductActionView.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import SwiftUI

struct ProductActionView: View {
    @ObservedObject var viewModel: ProductActionViewModel
    var body: some View {
        HStack(spacing: 8) {
            Spacer()
            Button {
            } label: {
                HStack {
                    Spacer()
                    Text(viewModel.buyNow)
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .viewBackgroundGradientStyle()
                .primaryButtonStyle()
            }
            Button {
            } label: {
                HStack {
                    Spacer()
                    Text(viewModel.addToCart)
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .secondaryButtonStyle()
            }
            Spacer()
        }
        .padding(.top, 6)
        .padding(.bottom, 34)
        .background(Color.appDarkGreen)
    }
}
struct ProductActionView_Previews: PreviewProvider {
    static var previews: some View {
        ProductActionView(viewModel: ProductActionViewModel(nil))
    }
}
