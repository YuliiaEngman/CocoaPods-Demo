//
//  Cocktail.swift
//  CocoaPods-Demo
//
//  Created by Yuliia Engman on 2/27/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import Foundation

struct DrinksWrapper: Codable {
    let drinks: [Cocktail]
}

struct Cocktail: Codable {
    let strDring: String // cocktail name
    let strDrinkThumb: String //cocktail image
}
