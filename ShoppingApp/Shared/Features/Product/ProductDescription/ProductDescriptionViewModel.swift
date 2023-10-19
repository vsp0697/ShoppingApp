//
//  ProductDescriptionViewModel.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import Foundation
class ProductDescriptionViewModel: ObservableObject {
    // MARK: - Published
    @Published var name: String = ""
    @Published var finalprice: String = ""
    @Published var originalPrice: String = ""
    @Published var discount: String = ""
    @Published var description: String = ""
    @Published var readMore: String = ""
    // MARK: - Variable
    var product: Product?
    init(_ product: Product?) {
        self.product = product
        setData()
    }
    private func setData() {
        guard let product = product else { return }
        self.name = product.title ?? ""
        if let amount = product.amount {
            if let offerPercentage = product.offerPercentage {
                self.finalprice = calculateDiscount(amount.description, discountPercentage: offerPercentage.description)
                self.originalPrice = "₹ \(amount.description)"
                self.discount = "(\(offerPercentage.description)% \(AppLiterals.off))"
            } else {
                self.finalprice = amount.description
            }
        }
        self.description = product.description ?? ""
        self.readMore = "Read item description"
    }
    private func calculateDiscount(_ originalPrice: String, discountPercentage: String) -> String {
        if let price = Double(originalPrice),
           let percentage = Double(discountPercentage) {
            let discount = price * percentage / 100
            return "₹ \(String(format: "%.0f", discount))"
        }
        return ""
    }
}
