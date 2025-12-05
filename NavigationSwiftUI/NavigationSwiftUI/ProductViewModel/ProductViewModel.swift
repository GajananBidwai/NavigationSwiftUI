//
//  ProductViewModel.swift
//  NavigationSwiftUI
//
//  Created by Neosoft on 05/12/25.
//

import Foundation
import SwiftUI

class ProductViewModel {
    @State var product: [Product] = []
    static let shared = ProductViewModel()
    
    func fetchData(){
        APIHelper().fetchData(url: Constant.product) { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let product):
                    self.product = product
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
