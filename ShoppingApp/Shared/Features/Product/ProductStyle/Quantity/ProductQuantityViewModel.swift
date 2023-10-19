//
//  ProductQuantityViewModel.swift
//  ShoppingApp
//
//  Created by Nikita on 19/10/23.
//

import Foundation
class ProductQuantityViewModel: ObservableObject {
    // MARK: - Variable
    var selectedSize: Size?
    var quantity: Int
    var selectedQuantity: Int = 0
    init(selectedSize: Size?, selectedQuantity: Int?) {
        self.selectedSize = selectedSize
        self.quantity = selectedSize?.quantity.max ?? 0
        self.selectedQuantity = selectedQuantity ?? 0
    }
}
