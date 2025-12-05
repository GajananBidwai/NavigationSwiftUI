//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by Neosoft on 05/12/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var product: [Product] = []
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear(perform: {
            APIHelper.shared.fetchData(url: "https://fakestoreapi.com/products") { result in
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
