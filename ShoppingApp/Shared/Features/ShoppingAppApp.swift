//
//  ShoppingAppApp.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import SwiftUI

@main
struct ShoppingAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ProductDetailView()
            }
        }
    }
    init() {
        UIScrollView.appearance().bounces = false
    }
}
