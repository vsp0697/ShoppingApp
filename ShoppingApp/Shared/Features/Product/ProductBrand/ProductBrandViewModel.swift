//
//  ProductBrandViewModel.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import Foundation
class ProductBrandViewModel: ObservableObject {
    // MARK: - Published
    @Published var brandName: String = ""
    @Published var verficationDescription: String = ""
    @Published var demandTitle: String = ""
    @Published var demandDescription: String = ""
    @Published var isShowDemandView: Bool = false
    // MARK: - Variable
    var product: Product?
    init(_ product: Product?) {
        self.product = product
        setData()
    }
    private func setData() {
        guard let product = product else { return }
        self.brandName = product.store ?? ""
        if let isVerified = product.verified, isVerified {
            self.verficationDescription = "\(product.verifiedBy ?? "") \(AppLiterals.verifiedBy)"
        }
        if let demand = product.demand {
            isShowDemandView = true
            demandTitle = demand.title ?? ""
            demandDescription = demand.description ?? ""
        }
    }
}
