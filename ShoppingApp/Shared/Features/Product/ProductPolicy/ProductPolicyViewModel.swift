//
//  ProductPolicyViewModel.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import Foundation
class ProductPolicyViewModel: ObservableObject {
    // MARK: - Variable
    var product: Product?
    @Published var sellers: [PurchaseProtection] = []
    init(_ product: Product?) {
        self.product = product
        setData()
    }
    private func setData() {
        guard let product = product, let sellerPolicy = product.sellerPolicy else { return }
        self.sellers = sellerPolicy.list ?? []
    }
}
