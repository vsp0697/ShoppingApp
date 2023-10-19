//
//  ProductStylePickerView.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import SwiftUI

struct ProductStylePickerView: View {
    @ObservedObject var viewModel: ProductStylePickerViewModel
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack {
                Text(viewModel.selectedValue.isEmpty ? viewModel.pickerTitle : viewModel.selectedValue)
                    .textViewStyle(.twelve, style: .medium, color: .white)
                Spacer()
                Asset.down
            }
            .padding()
            .background(Color.appDarkGrey)
            .cornerRadius(4)
            .if(!viewModel.selectedValue.isEmpty, transform: { view in
                view
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(LinearGradient(
                                colors: [.appProfileGradientDark, .appProfileGradientLight],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                                    , lineWidth: 1)
                    )
            })
                if !viewModel.selectedValue.isEmpty {
                Text(viewModel.pickerTitle)
                    .textViewStyle(.twelve, style: .medium, color: .white)
                    .frame(height: 30)
                    .padding(.leading, 4)
                    .padding(.trailing, 4)
                    .background(VStack(spacing: .zero) { Color.appBackGround; Color.appDarkGrey})
                    .padding(.top, -15)
                    .padding(.leading)
                    .padding(.leading, -4)
            }
        }
        .padding(.top, 15)
    }
}

struct ProductStylePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ProductStylePickerView(viewModel: ProductStylePickerViewModel(nil, pickerTitle: "", selectedValue: ""))
    }
}
