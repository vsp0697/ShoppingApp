//
//  ProductColorView.swift
//  ShoppingApp
//
//  Created by Nikita on 19/10/23.
//

import SwiftUI

struct ProductColorView: View {
    @StateObject var viewModel: ProductColorViewModel
    @Binding var isPresented: Bool
    var callBack: (HexColor?) -> Void
    var body: some View {
        VStack {
            HStack {
                Text(AppLiterals.color)
                    .textViewStyle(.ninteen, style: .medium, color: .white)
                Spacer()
                Button(action: {
                    callBack(viewModel.selectedColor)
                    isPresented = false
                }) {
                    Text(AppLiterals.done)
                        .textViewStyle(.ninteen, style: .medium, color: .appProfileGradientDark)
                }
            }
            ScrollView {
                Spacer()
                VStack {
                    ForEach(viewModel.colors, id: \.id) { color in
                        Button(action: {
                            viewModel.selectedColor = color
                        }) {
                            HStack {
                                Text(color.title)
                                    .textViewStyle(.fourteen, style: .medium, color: .white)
                                Spacer()
                                Rectangle()
                                    .fill(Color(hex: (color.hex)))
                                    .frame(width: 20, height: 20)
                                    .cornerRadius(5)
                            }
                            .padding()
                        }
                        
                        .buttonStyle(BorderedButtonStyle(selected: viewModel.selectedColor?.id == color.id))
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 30)
        .background(
            Color.appBackGround
                .ignoresSafeArea())
    }
}
