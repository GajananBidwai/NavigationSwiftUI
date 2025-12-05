//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by Neosoft on 05/12/25.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @State var product: [Product] = []
    
    var body: some View {
        VStack {
            //Toolbar
            List {
                ForEach(product) { product in
                    ProductCell(productName: "\(product.title)", productPrice: "Rs.\(product.price)", productImage: product.image)
                }
            }
        }
        .onAppear(perform: {
            APIHelper.shared.fetchData(url: Constant.product) { result in
                switch result {
                case .success(let product):
                    self.product = product
                case .failure(_):
                    print("Error while getting data in View")
                }
            }
        })
        .padding()
    }
    
}


#Preview {
    ContentView()
}
