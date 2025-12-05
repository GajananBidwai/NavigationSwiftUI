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
        NavigationStack {
            //ScrollViewReader
            //ScrollView
            //Tool bar
            //ToolbarItem
            //ToolbarItemGroup
            
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(product) { item in
                            ProductCell(
                                productName: item.title,
                                productPrice: "Rs.\(item.price)",
                                productImage: item.image
                            )
                            .id(item.id)
                        }
                    }
                }
                .navigationTitle("Product")
                .toolbar {
                    ToolbarItemGroup {
                        Button {
                            if let firstID = product.first?.id {
                                withAnimation {
                                    proxy.scrollTo(firstID, anchor: .bottom)
                                }
                            }
                        } label: {
                            Image(systemName: "arrow.up")
                        }
                        
                        Button {
                            if let lastId = product.last?.id {
                                withAnimation {
                                    proxy.scrollTo(lastId, anchor: .top)
                                }
                            }
                        } label: {
                            Image(systemName: "arrow.down")
                        }
                    }
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
