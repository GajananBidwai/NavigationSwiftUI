//
//  APIHelper.swift
//  Freshly
//
//  Created by Neosoft on 04/07/25.
//

import Foundation
import SwiftUI

enum DataError: Error{
    case invalidResponse
    case invalidUrl
    case invaldData
    case invalidDecoding
    case network(Error?)
}


class APIHelper{
    
    static let shared: APIHelper = APIHelper()
//    private init() {}
    
    var product: [Product] = []
    
    func fetchData(url: String, completionHandler: @escaping (Result<[Product], DataError>)->Void){
        
        guard let url = URL(string: url) else {
            
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { productData, productResponse, error in
            
            guard let data = productData else {
                completionHandler(.failure(.invaldData))
                return
            }
            
            guard let response = productResponse as? HTTPURLResponse,
                  199...299 ~= response.statusCode else{
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            do{
                let productResponse = try JSONDecoder().decode([Product].self, from: data)
                self.product = productResponse
                completionHandler(.success(self.product))
            }catch{
                completionHandler(.failure(.invalidDecoding))
                print("Error \(response)")
            }
        }
        .resume()
    }
    
}
