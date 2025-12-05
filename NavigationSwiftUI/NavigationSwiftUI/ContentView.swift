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
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            //ScrollViewReader
            //ScrollView
            //Tool bar
            //ToolbarItem
            //ToolbarItemGroup
            
            ScrollViewReader { proxy inx
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(CommonFunction.shared.filteredItems) { item in
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
        .searchable(text: $searchText, prompt: Text("Search Text"))
        .onChange(of: searchText, initial: false, { old, value in
            let search = value.trimmingCharacters(in: .whitespaces)
            CommonFunction.shared.filterValue(search: search)
        })
        
        .onAppear(perform: {
            APIHelper.shared.fetchData(url: Constant.product) { result in
                switch result {
                case .success(let product):
                    self.product = product
                    CommonFunction.shared.product = product
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
