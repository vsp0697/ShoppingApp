//
//  ProductProtection.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import SwiftUI

struct ProductProtectionView: View {
    @ObservedObject var viewModel: ProductProtectionViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 29) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Image(viewModel.icon)
                        .resizable()
                        .frame(width: 14, height: 18)
                    Text(viewModel.title)
                        .textViewStyle(.twelve, style: .medium, color: .white)
                    Spacer()
                }
                Text(viewModel.description)
                    .multilineTextAlignment(.leading)
                    .textViewStyle(.twelve, style: .medium, color: .white)
            }
            SepratorView()
        }
    }
}

struct ProductProtection_Previews: PreviewProvider {
    static var previews: some View {
        ProductProtectionView(viewModel: ProductProtectionViewModel(nil))
    }
}
