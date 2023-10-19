//
//  ProductPolicyView.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import SwiftUI

struct ProductPolicyView: View {
    @ObservedObject var viewModel: ProductPolicyViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(AppLiterals.sellerPolicy)
                .textViewStyle(.fifteen, style: .medium, color: .white)
            VStack(alignment: .leading, spacing: 16) {
                ForEach(viewModel.sellers, id: \.self) { seller in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 8) {
                            Image(seller.icon)
                            Text(seller.title)
                                .textViewStyle(.twelve, style: .medium, color: .white)
                            Spacer()
                        }
                        Text(seller.description)
                            .textViewStyle(.twelve, style: .medium, color: .appGreyShade1)
                    }
                }
                if let urlString = viewModel.product?.sellerPolicy?.terms, let url = URL(string: urlString) {
                    Link(destination: url) {
                        GradientTextView(text: AppLiterals.termsConditions)
                    }
                }
                SepratorView()
            }
        }
    }
}

struct ProductPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        ProductPolicyView(viewModel: ProductPolicyViewModel(nil))
    }
}
