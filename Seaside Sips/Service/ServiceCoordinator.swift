//
//  ServiceCoordinator.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import Foundation
import Combine

protocol ServiceCoordinatorProtocol {
    func getDrinks(endPoint: Endpoint) -> Future<Drinks, Error>
    func getDrinkDetailsById(drinkId: String) -> Future<SingleDrink, Error>
    func searchDrinksByFirstLetter(letter: String) -> Future<Drinks, Error>
}

// ServiceCoordinator is mediator class for calling the API's
class ServiceCoordinator: ServiceCoordinatorProtocol {
    
    // getDrinks is used to get the list of cocktails
    func getDrinks(endPoint: Endpoint) -> Future<Drinks, Error> {
        ServiceManager.shared.getData(endpoint: endPoint.path, type: Drinks.self)
    }
    
    // getDrinkDetailsById is used to get the single cocktaildetails by id
    func getDrinkDetailsById(drinkId: String) -> Future<SingleDrink, Error> {
        ServiceManager.shared.getData(endpoint: Endpoint.alcoholDetails.path + drinkId, type: SingleDrink.self)
    }
    
    // searchDrinksByFirstLetter is used to get the list of cocktails by search letter
    func searchDrinksByFirstLetter(letter: String) -> Future<Drinks, Error> {
        ServiceManager.shared.getData(endpoint: Endpoint.alcoholSearch.path + letter, type: Drinks.self)
    }
}

