//
//  ProductDetailView.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import SwiftUI
struct ProductDetailView: View {
    @StateObject var viewModel = ProductDetailViewModel()
    var body: some View {
        list
            .toolbar(content: toolbarContent)
    }
    @ViewBuilder var list: some View {
        GeometryReader { geometryReader in
            ScrollView {
                VStack(spacing: 22) {
                    ZStack(alignment: .bottom) {
                        ProductCarouselView(viewModel: viewModel)
                        progressView
                    }
                    .frame(height: geometryReader.size.width/1.2)
                    VStack(spacing: 26) {
                        VStack(spacing: 13) {
                            ProductDescriptionView(viewModel: ProductDescriptionViewModel(viewModel.product))
                            VStack(spacing: 32) {
                                VStack(spacing: 23) {
                                    ProductBrandView(viewModel: ProductBrandViewModel(viewModel.product))
                                    ProductStyleView(viewModel: ProductStyleViewModel(viewModel.product))
                                }
                                ProductPolicyView(viewModel: ProductPolicyViewModel(viewModel.product))
                            }
                            ProductProtectionView(viewModel: ProductProtectionViewModel(viewModel.product))
                        }
                        .padding(.horizontal, 22)
                        ProductActionView(viewModel: ProductActionViewModel(viewModel.product))
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .background(Color.appBackGround)
    }
    @ViewBuilder var progressView: some View {
        if let productImages = viewModel.product?.productImages {
            HStack {
                ForEach(Array(productImages.enumerated()), id: \.offset) { index, productImage in
                    ProgressCarousel(index: index, viewModel: viewModel)
                }
            }
            .onReceive(viewModel.autoChangeImageTimer) { _ in
                viewModel.updateProgress()
            }
        }
    }
    @ToolbarContentBuilder func toolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button { } label: {
                Text("")
                Asset.back
                    .frame(width: 15, height: 12.049)
            }
            .frame(width: 40, height: 40)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack(spacing: 0) {
                Button { } label: {
                    ZStack(alignment: .topTrailing) {
                        Asset.cartShopping
                            .frame(width: 18, height: 18)
                        ZStack {
                            gradientCircleView
                            Text(viewModel.cartCount)
                                .foregroundColor(.black)
                                .font(Font.WorkSans.regular.forSize(.ten))
                        }
                        .padding(.top, -4)
                        .padding(.trailing, -4)
                    }
                }
                .frame(width: 34, height: 34)
                Button { } label: {
                    Text("")
                    Asset.ellipsis
                        .frame(width: 18, height: 18)
                }
                .frame(width: 34, height: 34)
            }
        }
    }
    @ViewBuilder var gradientCircleView: some View {
        Circle()
            .fill(
                AngularGradient(gradient: Gradient(colors: [Color.appProfileGradientLight, Color.appProfileGradientDark]), center: .center, startAngle: .zero, endAngle: .degrees(360))
            )
            .frame(width: 11, height: 11)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
