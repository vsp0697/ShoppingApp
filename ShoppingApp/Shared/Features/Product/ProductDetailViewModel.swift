//
//  ProductDetailViewModel.swift
//  ShoppingApp
//
//  Created by Nikita on 18/10/23.
//
import Foundation
class ProductDetailViewModel: ObservableObject {
    // MARK: - Constant
    let autoChangeImageTimer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    // MARK: - Variable
    var product: Product?
    var cartCount = "2"
    var currentProductImageIndex: Int {
        return currentTabBar - 1
    }
    // MARK: - Published
    @Published var progresses: [ProgressCarouselModel] = []
    @Published var currentTabBar: Int = 1 {
        didSet {
            resetTheProgress()
        }
    }
    init() {
        loadData()
        loadProgress()
    }
}
extension ProductDetailViewModel {
    private func loadData() {
        if let url = Bundle.main.url(forResource: "ProductDetail", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                product = try decoder.decode(Product.self, from: data)
            } catch {
                print("error:\(error)")
            }
        }
    }
    private func loadProgress() {
        guard let product else { return }
        product.productImages.forEach { _ in
            progresses.append(ProgressCarouselModel(currentProgress: 0))
        }
        
        Task { @MainActor in
            try await Task.sleep(for: .seconds(0.1))
            guard let progress = progresses.first else { return }
            progresses[0].currentProgress = progress.currentProgress + 1
        }
    }
    private func resetTheProgress() {
        for (index, _) in progresses.enumerated() {
            if index < currentProductImageIndex {
                progresses[index].currentProgress = 100
            } else {
                progresses[index].currentProgress = 0
            }
        }
    }
    func updateProgress() {
        let currentProgress = progresses[currentProductImageIndex].currentProgress + 5
        if currentProgress < 96 {
            progresses[currentProductImageIndex].currentProgress = currentProgress
        } else if currentProductImageIndex < ((product?.productImages.count ?? 0) - 1) {
            currentTabBar = currentTabBar + 1
        } else {
            currentTabBar = 1
        }
    }
}
