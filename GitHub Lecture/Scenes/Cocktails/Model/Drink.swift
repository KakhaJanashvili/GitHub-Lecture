//
//  Drink.swift
//  GitHub Lecture
//
//  Created by Kakha janashvili on 09.01.23.
//

import Foundation

struct DrinkResponse: Codable {
    let drinks: [Drink]
}


struct Drink: Codable {
    let name: String
    let image: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name   = "strDrink"
        case image  = "strDrinkThumb"
        case id     = "idDrink"
    }
      
}
