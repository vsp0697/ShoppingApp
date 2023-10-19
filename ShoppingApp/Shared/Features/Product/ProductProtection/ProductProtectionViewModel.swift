//
//  ProductProtectionViewModel.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import Foundation
class ProductProtectionViewModel: ObservableObject {
    // MARK: - Variable
    var product: Product?
    // MARK: - Published
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var icon: String = ""
    init(_ product: Product?) {
        self.product = product
        setData()
    }
    private func setData() {
        guard let product = product, let purchaseProtection = product.purchaseProtection else { return }
        title = purchaseProtection.title
        icon = purchaseProtection.icon
        description = purchaseProtection.description
    }
}
