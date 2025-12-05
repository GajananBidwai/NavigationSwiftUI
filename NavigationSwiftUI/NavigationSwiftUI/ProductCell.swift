//
//  ProductCell.swift
//  NavigationSwiftUI
//
//  Created by Neosoft on 05/12/25.
//

import SwiftUI

struct ProductCell: View {
    @State var productName: String = "adqw jkdewjkdnewkjdwe"
    @State var productPrice: String = "qdwqd wjnedewkjdmw"
    @State var productImage: String = ""
    
    var body: some View {
        HStack {
            
            Image(productImage)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(productName)
                    .font(.system(size: 24, weight: .bold))
                Text(productPrice)
            }
            
            
            
        }
        .overlay(alignment: .center) {
            Rectangle()
                .stroke(style: StrokeStyle(lineWidth: 1))
                
        }
    }
}

#Preview {
    ProductCell()
}
