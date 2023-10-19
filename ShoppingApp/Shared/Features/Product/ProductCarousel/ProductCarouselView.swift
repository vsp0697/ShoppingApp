//
//  ProductCarouselView.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//
import SwiftUI

struct ProductCarouselView: View {
    @ObservedObject var viewModel = ProductDetailViewModel()
    var body: some View {
        if let productImages = viewModel.product?.productImages {
            TabView(selection: $viewModel.currentTabBar) {
                ForEach(productImages, id: \.id) { images in
                    Image(images.icon)
                        .resizable()
                        .scaledToFill()
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct ProductCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCarouselView()
    }
}
