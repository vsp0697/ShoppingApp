//
//  ProductColorViewModel.swift
//  ShoppingApp
//
//  Created by Nikita on 19/10/23.
//

import Foundation
class ProductColorViewModel: ObservableObject {
    // MARK: - Variable
    var selectedSize: Size?
    var colors: [HexColor] = []
    var selectedColor: HexColor?
    init(selectedSize: Size?, selectedColor: HexColor?) {
        self.selectedSize = selectedSize
        self.colors = selectedSize?.colors ?? []
        self.selectedColor = selectedColor
    }
}
