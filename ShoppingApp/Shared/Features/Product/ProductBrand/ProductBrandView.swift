//
//  ProductBrandView.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import SwiftUI

struct ProductBrandView: View {
    @ObservedObject var viewModel: ProductBrandViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 23) {
            brandView
            demandView
                .isHidden(!viewModel.isShowDemandView)
        }
    }
    @ViewBuilder var brandView: some View {
        HStack(spacing: 7) {
            Text(viewModel.brandName)
                .textViewStyle(.ten, style: .medium, color: .white)
            if !viewModel.verficationDescription.isEmpty {
                HStack(spacing: 4) {
                    Asset.badgeCheck
                    Text(viewModel.verficationDescription)
                        .textViewStyle(.ten, style: .medium, color: .appGreyShade1)
                }
            }
            Spacer()
        }
    }
    @ViewBuilder var demandView: some View {
        HStack(spacing: 13) {
            Asset.stars
            VStack(alignment: .leading) {
                Text(viewModel.demandTitle)
                    .textViewStyle(.ten, style: .medium, color: .black)
                Text(viewModel.demandDescription)
                    .textViewStyle(.ten, style: .medium, color: .appGreyShade2)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.appGreenShade1)
        .cornerRadius(4)
    }
    
}
struct ProductBrandView_Previews: PreviewProvider {
    static var previews: some View {
        ProductBrandView(viewModel: ProductBrandViewModel(nil))
    }
}
