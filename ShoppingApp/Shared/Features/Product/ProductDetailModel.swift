//
//  ProductDetailModel.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

// MARK: - Product
struct Product: Codable {
    var productImages: [ProductImage]
    var title: String?
    var amount, offerPercentage: Int?
    var description, store: String?
    var verified: Bool?
    var verifiedBy: String?
    var demand: Demand?
    var size: [Size]?
    var sellerPolicy: SellerPolicy?
    var purchaseProtection: PurchaseProtection?
    var buyTitle, addToCart: String?
}

// MARK: - Demand
struct Demand: Codable {
    var title, description: String?
}

// MARK: - ProductImage
struct ProductImage: Codable {
    var id: Int
    var icon: String
}

// MARK: - PurchaseProtection
struct PurchaseProtection: Codable, Hashable {
    var title, icon, description: String
}

// MARK: - SellerPolicy
struct SellerPolicy: Codable {
    var list: [PurchaseProtection]?
    var terms: String?
}

// MARK: - Size
struct Size: Codable {
    var id: Int
    var title: String?
    var price: Double
    var stock: Bool
    var colors: [HexColor]
    var quantity: Quantity
}

// MARK: - Color
struct HexColor: Codable {
    var id: Int
    var title, hex: String
}

// MARK: - Quantity
struct Quantity: Codable {
    var max: Int
}
