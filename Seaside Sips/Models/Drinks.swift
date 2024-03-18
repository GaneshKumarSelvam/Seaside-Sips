//
//  Drink.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import Foundation

/*
 This struct is used for 3 api's i.e., /Alcoholic=, /Non_Alcoholic= & 1/search.php?f=a
 */

// MARK: - Drinks
struct Drinks: Codable {
    var drinks: [DrinkModel]?
}

// MARK: - DrinkModel
struct DrinkModel: Codable, Identifiable {
    var strDrink: String?
    var strDrinkThumb: String?
    var id: String?
    
    enum CodingKeys: String, CodingKey {
        case strDrink
        case strDrinkThumb
        case id = "idDrink"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        strDrink = try? values.decodeIfPresent(String.self, forKey: .strDrink)
        strDrinkThumb = try? values.decodeIfPresent(String.self, forKey: .strDrinkThumb)
        id = try? values.decodeIfPresent(String.self, forKey: .id)
    }
}
