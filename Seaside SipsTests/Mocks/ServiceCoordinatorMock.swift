//
//  ServiceCoordinatorMock.swift
//  Seaside SipsTests
//
//  Created by Ganesh Kumar on 18/03/24.
//

import Foundation
import Combine
@testable import Seaside_Sips

class MockServiceCoordinator {
    
    var shouldReturnError = false
    var isGetDrinksAPICalled = false
    var isGetDrinkDetailsByIdAPICalled = false
    var isSearchDrinksByAPICalled = false
    var cancellables = Set<AnyCancellable>()
    
    var mockDrinks: Drinks? {
        return Utility.shared.getJsonObjectFromBundle(fileName: MockJsonFileNames.alcoholic)
    }
    
    var mockSingleDrinkById: SingleDrink? {
        return Utility.shared.getJsonObjectFromBundle(fileName: MockJsonFileNames.singleDrink)
    }
    
    func reset() {
        shouldReturnError = false
        isGetDrinksAPICalled = false
        isGetDrinkDetailsByIdAPICalled = false
        isSearchDrinksByAPICalled = false
    }
    
    convenience init() {
        self.init(false)
    }
    
    init(_ shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
}

extension MockServiceCoordinator: ServiceCoordinatorProtocol {
    
    func getDrinks(endPoint: Endpoint) -> Future<Drinks, Error> {
        isGetDrinksAPICalled = true
        return Future<Drinks, Error> { [weak self] promise in
            guard let drinkModel = self?.mockDrinks, !(drinkModel.drinks?.isEmpty ?? true) else {
                promise(.failure(NetworkError.unknown))
                return
            }
            promise(.success(drinkModel))
        }
        
    }
    
    
    func getDrinkDetailsById(drinkId: String) -> Future<SingleDrink, Error> {
        isGetDrinkDetailsByIdAPICalled = true
        return Future<SingleDrink, Error> { [weak self] promise in
            guard let drinkModel = self?.mockSingleDrinkById, !(drinkModel.drinks?.isEmpty ?? true)  else {
                promise(.failure(NetworkError.unknown))
                return
            }
            promise(.success(drinkModel))
        }
    }
    
    func searchDrinksByFirstLetter(letter: String) -> Future<Drinks, Error> {
        isSearchDrinksByAPICalled = true
        return Future<Drinks, Error> { [weak self] promise in
            guard let drinkModel = self?.mockDrinks, !(drinkModel.drinks?.isEmpty ?? true) else {
                promise(.failure(NetworkError.unknown))
                return
            }
            promise(.success(drinkModel))
        }
        
    }
}
