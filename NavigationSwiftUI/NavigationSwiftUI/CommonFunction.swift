//
//  CommonFunction.swift
//  NavigationSwiftUI
//
//  Created by Neosoft on 05/12/25.
//

import Foundation

import SwiftUI

class CommonFunction: ObservableObject {
    
    static let shared = CommonFunction()
    private init() {}
    
    @Published var filteredItems: [Product] = []
    @Published var product: [Product] = []
    
    func filterValue(search: String) {
        if search.isEmpty {
            filteredItems = product.sorted { $0.title < $1.title }
        } else {
            filteredItems = product
                .filter { $0.title.localizedStandardContains(search) }
                .sorted { $0.title < $1.title }
        }
    }
}
