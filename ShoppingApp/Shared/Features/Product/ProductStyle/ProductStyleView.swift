//
//  ProductStyleView.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//

import SwiftUI
struct ProductStyleView: View {
    @StateObject var viewModel: ProductStyleViewModel
    var body: some View {
        VStack(spacing: 8) {
            ForEach(ProductStyle.allCases, id: \.self) { item in
                VStack {
                    switch item {
                    case .size:
                        ProductStylePickerView(viewModel: ProductStylePickerViewModel(viewModel.product, pickerTitle: item.tilte, selectedValue: viewModel.selectedSize?.title))
                    case .color:
                        ProductStylePickerView(viewModel: ProductStylePickerViewModel(viewModel.product, pickerTitle: item.tilte, selectedValue: viewModel.selectedColor?.title))
                    case .quantity:
                        ProductStylePickerView(viewModel: ProductStylePickerViewModel(viewModel.product, pickerTitle: item.tilte, selectedValue: viewModel.selectedQuantity?.description))
                    }
                }
                .onTapGesture {
                    switch item {
                    case .size:
                        guard !(viewModel.product?.size?.isEmpty ?? true) else { return }
                    default:
                        guard viewModel.selectedSize != nil else { return }
                    }
                    viewModel.selectedStyle = item
                    viewModel.isPopoverPresented.toggle()
                }
            }
        }
        .popover(isPresented: $viewModel.isPopoverPresented) {
            switch viewModel.selectedStyle {
            case .size:
                ProductSizeView(viewModel: ProductSizeViewModel(viewModel.product?.size, selectedSize: viewModel.selectedSize), isPresented: $viewModel.isPopoverPresented) { selectedSize in
                    if viewModel.selectedSize?.id != selectedSize?.id {
                        viewModel.selectedColor = nil
                        viewModel.selectedQuantity = nil
                    }
                    viewModel.selectedSize = selectedSize
                }
                .presentationDetents([.height(350)])
            case .color:
                ProductColorView(viewModel: ProductColorViewModel(selectedSize: viewModel.selectedSize, selectedColor: viewModel.selectedColor), isPresented: $viewModel.isPopoverPresented) { selectedColor in
                    viewModel.selectedColor = selectedColor
                }
                .presentationDetents([.height(350)])
            case .quantity:
                ProductQuantityView(viewModel: ProductQuantityViewModel(selectedSize: viewModel.selectedSize, selectedQuantity: viewModel.selectedQuantity), isPresented: $viewModel.isPopoverPresented) { selectedQuantity in
                    viewModel.selectedQuantity = selectedQuantity
                }
                .presentationDetents([.height(150)])
            case .none:
                EmptyView()
            }
        }
    }
}
