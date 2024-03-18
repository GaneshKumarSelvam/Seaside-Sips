//
//  Utility.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import Foundation

class Utility {
    
    static let shared = Utility()
    
    func getJsonObjectFromBundle<T: Codable>(fileName: String) -> T? {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: MockJsonFileNames.json) {
            guard let data = try? Data(contentsOf: URL(filePath: filePath)) else { return nil }
            let model = try? JSONDecoder().decode(T.self, from: data)
            return model
        }
        return nil
    }
    
    enum AlcoholTypes: Equatable {
        case alcoholic
        case nonAlcoholic
        case search
    }
    
    func getAlcoholicSingleJson() -> DrinkModel {
        let drinkModelArray : Drinks? = Utility.shared.getJsonObjectFromBundle(fileName: MockJsonFileNames.alcoholic)
        return (drinkModelArray?.drinks?[0])!
    }
    
    func getAlcoholicListJson() -> Drinks {
        let drinkModel : Drinks? = Utility.shared.getJsonObjectFromBundle(fileName: MockJsonFileNames.alcoholic)
        return drinkModel!
    }
    
    func getSingleDrinkJson() -> SingleDrink {
        let singleDrink : SingleDrink? = Utility.shared.getJsonObjectFromBundle(fileName: MockJsonFileNames.singleDrink)
        return singleDrink!
    }
}


struct MockJsonFileNames {
    static let json = "json"
    static let alcoholic = "Alcoholic"
    static let singleDrink = "SingleDrink"
}
