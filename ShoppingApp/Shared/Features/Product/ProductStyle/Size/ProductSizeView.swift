//
//  ProductSizeView.swift
//  ShoppingApp
//
//  Created by Nikita on 19/10/23.
//

import Foundation
import SwiftUI
struct ProductSizeView: View {
    @StateObject var viewModel: ProductSizeViewModel
    @Binding var isPresented: Bool
    var callBack: (Size?) -> Void
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Text(AppLiterals.size)
                    .textViewStyle(.ninteen, style: .medium, color: .white)
                Spacer()
                Button(action: {
                    callBack(viewModel.selectedSize)
                    isPresented = false
                }) {
                    Text(AppLiterals.done)
                        .textViewStyle(.ninteen, style: .medium, color: .appProfileGradientDark)
                }
            }
            ScrollView {
                VStack {
                    VStack(spacing: 8) {
                        ForEach(viewModel.sizes, id: \.id) { item in
                            Button(action: {
                                if item.stock {
                                    viewModel.selectedSize = item
                                }
                            })
                            {
                                HStack {
                                    Text(item.title ?? "")
                                        .textViewStyle(.twelve, style: .medium, color: .white)
                                    if !item.stock {
                                        Text(AppLiterals.outStock)
                                            .textViewStyle(.ten, style: .medium, color: .red)
                                        Spacer()
                                    }
                                    Spacer()
                                    Text("₹\(Int(item.price))")
                                        .textViewStyle(.twelve, style: .medium, color: viewModel.selectedSize?.id == item.id ? .appProfileGradientDark : .white)
                                }
                                .padding()
                            }
                            .buttonStyle(BorderedButtonStyle(selected: viewModel.selectedSize?.id == item.id))
                            .disabled(!item.stock)
                            .opacity(viewModel.selectedSize?.id != item.id  && !item.stock ? 0.3 : 1)
                        }
                    }
                }
                .ignoresSafeArea()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 30)
        .background(Color.appBackGround)
        
    }
}
struct CategorySizeView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSizeView(viewModel: ProductSizeViewModel(nil, selectedSize: nil), isPresented: .constant(true), callBack: {_ in})
    }
}
