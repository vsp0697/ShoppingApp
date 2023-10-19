//
//  ProductStylePickerViewModel.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import Foundation
import Combine
class ProductStylePickerViewModel: ObservableObject {
    // MARK: - Published
    @Published var pickerTitle: String = ""
    @Published var selectedValue: String = ""
    // MARK: - Variable
    var product: Product?
    init(_ product: Product?, pickerTitle: String, selectedValue: String?) {
        self.product = product
        self.pickerTitle = pickerTitle
        self.selectedValue = selectedValue ?? ""
    }
}
