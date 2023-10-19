//
//  ProductStyleModel.swift
//  ShoppingApp
//
//  Created by Nikita on 19/10/23.
//

import Foundation
enum ProductStyle: String, CaseIterable {
    case size
    case color
    case quantity
    var tilte: String {
        switch self {
        case .size:
            return AppLiterals.size
        case .color:
            return AppLiterals.color
        case .quantity:
            return AppLiterals.quantity
        }
    }
}
