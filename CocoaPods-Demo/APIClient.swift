//
//  APIClient.swift
//  CocoaPods-Demo
//
//  Created by Yuliia Engman on 2/27/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import Foundation
import Alamofire // here substitute the import NetworkHelper

struct APIClient {
    
    static func fetchCocktail(completion: @escaping (AFResult<Cocktail>) -> ()) {
        let endpointURLString = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
        
        //we need a URL
        guard let url = URL(string: endpointURLString) else {
            return
        }
        
        AF.request(url).response { (response) in
            //response has data -> response.data
            //response has error -> response.error
            //response has request -> response.request
            
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                // stir our cocktail
                do {
                    let results = try JSONDecoder().decode(DrinksWrapper.self, from: data)
                    //completion(.success(Cocktail))
                    //because we have 1 drink we can write this code
                    if let cocktail = results.drinks.first {
                        completion(.success(cocktail))
                    }
                } catch {
                   // completion(.failure(error))
                    print("error")
                }
            }
        }
    }
}
