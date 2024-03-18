//
//  DrinkListViewModel.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import Foundation
import Combine

/*
 DrinkListViewModel is used for all the 3 categories from the category page i.e., DrinkListView, SearchDetailView
 */

@Observable
class DrinkListViewModel {
    var loading = false
    var drinkModelArray = [DrinkModel]()
    var serviceCoordinator: ServiceCoordinatorProtocol
    private var cancellables = Set<AnyCancellable>() // (1)
    
    init(serviceCoordinator: ServiceCoordinatorProtocol) {
        self.serviceCoordinator = serviceCoordinator
    }
    
    func fetchDrinks(type: Utility.AlcoholTypes) {
        loading = true
        serviceCoordinator.getDrinks(endPoint: type == .alcoholic ? Endpoint.alcoholic : Endpoint.nonAlcoholic) // (2) -> Publisher
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
