//
//  ProductStyleViewodel.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import Foundation
class ProductStyleViewModel: ObservableObject {
    // MARK: - Published
    @Published var isPopoverPresented = false
    @Published var isColorPopoverPresented = false
    @Published var isQuantityPopoverPresented = false
    @Published var selectedSize: Size?
    @Published var selectedQuantity: Int?
    @Published var selectedColor: HexColor?
    @Published var selectedStyle: ProductStyle?
    // MARK: - Variable
    var product: Product?
    init(_ product: Product?) {
        self.product = product
    }
}
