//
//  DrinkDetailViewModel.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import Foundation
import Combine

/*
 DrinkDetailViewModel is used for the detal page DrinkDetailView
 */

@Observable
class DrinkDetailViewModel {
    var loading = false
    var signleDrink = SingleDrink()
    var serviceCoordinator: ServiceCoordinatorProtocol
    private var cancellables = Set<AnyCancellable>() // (1)
    
    init(serviceCoordinator: ServiceCoordinatorProtocol) {
        self.serviceCoordinator = serviceCoordinator
    }
    
    func fetchDrinkById(id: String) {
        loading = true
        serviceCoordinator.getDrinkDetailsById(drinkId: id)
            .sink { [weak self] completion in // (3) -> Subscriber
                self?.loading = false
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] returnedDrinks in
                self?.signleDrink = returnedDrinks
            } .store(in: &cancellables) // (4)
    }
    
    
    var drinkModel: DrinkDetailModel? {
        if let drinks = signleDrink.drinks,
           drinks.count > 0 {
            return drinks[0]
        }
        return nil
    }
    
    var shouldShowTitle: Bool {
        guard getTitle != nil else {
            return false
        }
        return true
    }
    
    var getTitle: String? {
        guard let title = drinkModel?.strDrink, !title.isEmpty else {
           return nil
        }
        return title
    }
    
    
    var shouldShowInstructions: Bool {
        guard getInstructions != nil else {
            return false
        }
        return true
    }
    
    var getInstructions: String? {
        guard let instructions = drinkModel?.strInstructions, !instructions.isEmpty else {
           return nil
        }
        return instructions
    }
    
    var shouldShowCategory1: Bool {
        guard getCategory1 != nil else {
            return false
        }
        return true
    }
    
    var getCategory1: String? {
        guard let category1 = drinkModel?.strAlcoholic, !category1.isEmpty else {
           return nil
        }
        return category1
    }
    
    
    var shouldShowCategory2: Bool {
        guard getCategory2 != nil else {
            return false
        }
        return true
    }
    
    var getCategory2: String? {
        guard let category2 = drinkModel?.strCategory, !category2.isEmpty else {
           return nil
        }
        return category2
    }
    
    var shouldShowIngredients: Bool {
        guard getIngredientsArray != nil else {
            return false
        }
        return true
    }
    
    var getIngredientsArray: [String]? {
        guard let ingredients = drinkModel?.getDisplayIngredientsWithMeasures(), !ingredients.isEmpty else {
           return nil
        }
        return ingredients
    }

}
