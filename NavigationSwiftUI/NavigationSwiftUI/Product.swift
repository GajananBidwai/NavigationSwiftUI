//
//  Product.swift
//  Freshly
//
//  Created by Neosoft on 04/07/25.
//

import Foundation

struct Product: Codable, Identifiable{
    var id: Int
    var title: String
    var price: Float
    var description: String
    var category: String
    var image: String
    var rating: Rating
    
}

struct Rating: Codable{
    var rate: Float
    var count: Int
    
}
