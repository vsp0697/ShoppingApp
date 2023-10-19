//
//  ProductQuantityView.swift
//  ShoppingApp
//
//  Created by Nikita on 19/10/23.
//

import SwiftUI

struct ProductQuantityView: View {
    @StateObject var viewModel: ProductQuantityViewModel
    @Binding var isPresented: Bool
    var callBack: (Int) -> Void
    var body: some View {
        ZStack {
            Color.appBackGround
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        callBack(viewModel.selectedQuantity)
                        isPresented = false
                    }) {
                        Text(AppLiterals.done)
                            .textViewStyle(.ninteen, style: .medium, color: .appProfileGradientDark)
                    }
                }
                HStack {
                    Text(AppLiterals.quantity)
                        .textViewStyle(.ninteen, style: .medium, color: .white)
                    Spacer()
                    Stepper(value: $viewModel.selectedQuantity, in: 0...viewModel.quantity, step: 1) {}
                        .frame(width: 100)
                        .background(Color.gray)
                        .cornerRadius(10)
                    Text("\(viewModel.selectedQuantity)")
                        .textViewStyle(.fourteen, style: .medium, color: .white)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 30)
            .background(Color.appBackGround)
        }
    }
}
