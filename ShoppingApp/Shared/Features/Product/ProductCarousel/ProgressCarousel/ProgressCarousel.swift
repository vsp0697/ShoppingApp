//
//  ProgressCarousel.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import SwiftUI

struct ProgressCarousel: View {
    
    @State var index: Int = 0
    @ObservedObject var viewModel = ProductDetailViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.appProfileGradientDark, .appProfileGradientLight],
                startPoint: .leading,
                endPoint: .trailing
            ).mask {
                ProgressView(value: viewModel.progresses[index].currentProgress, total: 100)
            }
            .fixedSize(horizontal: false, vertical: true)
            .if(index == 0, transform: { view in
                view
                    .padding(.leading)
            })
                .if(index == (viewModel.product?.productImages.count ?? 0) - 1, transform: { view in
                    view
                        .padding(.trailing)
                })
                    .padding(.vertical)
        }
    }
}
