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
            
            ScrollViewReader { proxy in
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
        // IT called every time when user type or removed from text from text field
        .onSubmit(of: .search, {
            searchTerm()
        })
        .onChange(of: searchText, initial: false, { old, value in
            let search = value.trimmingCharacters(in: .whitespaces)
            CommonFunction.shared.filterValue(search: search)
            if value.isEmpty {
                searchTerm()
            }
        })
        
        //Gives Search suggestions from the list
        .searchSuggestions({
            ForEach(product) { result in
                Text("\(result.title)")
                    .searchCompletion(result.title)
            }
        })
        .onAppear(perform: {
            APIHelper.shared.fetchData(url: Constant.product) { result in
                switch result {
                case .success(let product):
                    self.product = product
                    CommonFunction.shared.product = product
                    CommonFunction.shared.filteredItems = product
                case .failure(_):
                    print("Error while getting data in View")
                }
            }
        })
        .padding()
        
        
        
        
    }
    func searchTerm(){
        let search = searchText.trimmingCharacters(in: .whitespaces)
        CommonFunction.shared.filterValue(search: search)
    }
    
}


#Preview {
    ContentView()
}
