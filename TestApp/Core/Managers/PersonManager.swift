//
//  PersonManager.swift
//  TestApp
//
//  Created by Giorgi Goginashvili on 11/15/23.
//


/*
 https://www.colourlovers.com/api/colors/new?format=json&fbclid=IwAR1SrA8_9Ys4WDqgXDHxOcabw1gXv5zrfOmETY85gEcryYinlJr3BD7lsnY
 result: Result<DrinkResponse, Error>
 */

import Foundation

protocol PersonManagerProtocol {
    func fetchPerson(completion: @escaping (Result<[Person], Error>) -> ())
}

class PersonManager: PersonManagerProtocol  {
    
    func fetchPerson(completion: @escaping (Result<[Person], Error>) -> ()) {
        NetworkManager.shared.get(url: "https://www.colourlovers.com/api/colors/new?format=json&fbclid=IwAR1SrA8_9Ys4WDqgXDHxOcabw1gXv5zrfOmETY85gEcryYinlJr3BD7lsnY") { (result: Result<[Person], Error>) in
            
            switch result {
            case .success(let response):
                completion(.success(response))
                print(response)
            case .failure(let error):
                completion(.failure(error))
                print(error)
            }
        }
    }
    
    
}
    
    

