//
//  DrinksAPIManager.swift
//  GitHub Lecture
//
//  Created by Kakha janashvili on 09.01.23.
//

import Foundation



enum DrinkType {
    case Alcoholic
    case NonAlcoholic
    case Cocktail
}


protocol DrinksAPIManagerProtocol {
    func fetchDrinks(completion: @escaping (Result<DrinkResponse, Error>) -> ())
    
}
    class DrinksAPIManager: DrinksAPIManagerProtocol {
        func fetchDrinks(completion: @escaping (Result<DrinkResponse, Error>) -> ()) {
            
            let urlString =
            "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
            
            guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else { return }
                
                do {
                    let decodedData = try JSONDecoder().decode(DrinkResponse.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    }
