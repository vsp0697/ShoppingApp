//
//  ProductSizeViewModel.swift
//  ShoppingApp
//
//  Created by Nikita on 19/10/23.
//

import Foundation
class ProductSizeViewModel: ObservableObject {
    // MARK: - Variable
    var sizes: [Size] = []
    var selectedSize: Size?
    init(_ sizes: [Size]?, selectedSize: Size?) {
        self.sizes = sizes ?? []
        self.selectedSize = selectedSize
    }
}
