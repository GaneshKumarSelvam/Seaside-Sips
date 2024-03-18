//
//  SearchDrinkViewModel.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import Foundation
import Combine

/*
 SearchDrinkViewModel is used for the search page SearchDrinkView
 */

@Observable
class SearchDrinkViewModel {
    var loading = false
    var drinkModelArray = [DrinkModel]()
    var serviceCoordinator: ServiceCoordinatorProtocol
    private var cancellables = Set<AnyCancellable>() // (1)
    var searchText = ""
    var newSearchedText = ""
    
    init(serviceCoordinator: ServiceCoordinatorProtocol) {
        self.serviceCoordinator = serviceCoordinator
    }
    
    func fetchDrinks() {
        loading = true
        serviceCoordinator.searchDrinksByFirstLetter(letter: searchText)
            .sink { [weak self] completion in // (3) -> Subscriber
                self?.loading = false
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] returnedDrinks in
                self?.drinkModelArray = returnedDrinks.drinks ?? []
            } .store(in: &cancellables) // (4)
    }
}
