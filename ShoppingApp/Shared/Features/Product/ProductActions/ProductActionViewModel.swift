//
//  ProductActionViewModel.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//
import Foundation
class ProductActionViewModel: ObservableObject {
    // MARK: - Variable
    var product: Product?
    // MARK: - Published
    @Published var buyNow: String = ""
    @Published var addToCart: String = ""
    @Published var icon: String = ""
    init(_ product: Product?) {
        self.product = product
        setData()
    }
    private func setData() {
        guard let product = product else { return }
        buyNow = product.buyTitle ?? ""
        addToCart = product.addToCart ?? ""
    }
}
