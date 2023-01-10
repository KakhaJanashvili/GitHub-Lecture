//
//  CoctailViewController.swift
//  GitHub Lecture
//
//  Created by Kakha janashvili on 09.01.23.
//

import UIKit

class CoctailViewController: UIViewController {

var drinksAPIManager: DrinksAPIManagerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        drinksAPIManager = DrinksAPIManager()
        
      drinksAPIManager?.fetchDrinks(completion: { result in
            switch result {
            case .success(let drinksResponse):
                print(drinksResponse.drinks)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }


}

