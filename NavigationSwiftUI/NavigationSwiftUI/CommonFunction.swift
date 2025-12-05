//
//  CommonFunction.swift
//  NavigationSwiftUI
//
//  Created by Neosoft on 05/12/25.
//

import Foundation

class CommonFunction {
    
    static let shared = CommonFunction()
    private init() {}
    
    var filteredItems: [Product] = []
    var product: [Product] = []
    
    func filterValue(search: String) {
        if search.isEmpty {
            filteredItems = product.sorted(by: { $0.title < $1.title })
        } else {
            let list = product.filter { items in
                return items.title.localizedStandardContains(search)
            }
            filteredItems = list.sorted(by: { $0.title < $1.title })
        }
    }
}
