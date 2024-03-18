//
//  SingleDrink.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import Foundation

/*
 This struct is used for the api's getting cocktail details by id /lookup.php?i=12560
 */

// MARK: - SingleDrink
struct SingleDrink: Codable {
    var drinks: [DrinkDetailModel]?
}

// MARK: - Drink
struct DrinkDetailModel: Codable {
    var idDrink: String?
    var strDrink: String?
    var strDrinkAlternate: String?
    var strTags: String?
    var strVideo : String?
    var strCategory: String?
    var strIBA: String?
    var strAlcoholic: String?
    var strGlass: String?
    var strInstructions: String?
    var strInstructionsES: String?
    var strInstructionsDE: String?
    var strInstructionsFR: String?
    var strInstructionsIT: String?
    var strInstructionsZHHANS: String?
    let strInstructionsZHHANT: String?
    var strDrinkThumb: String?
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strImageSource: String?
    var strImageAttribution: String?
    var strCreativeCommonsConfirmed: String?
    var dateModified: String?
    
    
    // Creating ingredients array
    func getStrIngredientsArr() -> [String?] {
        return[
            strIngredient1,
            strIngredient2,
            strIngredient3,
            strIngredient4,
            strIngredient5,
            strIngredient6,
            strIngredient7,
            strIngredient8,
            strIngredient9,
            strIngredient10,
            strIngredient11,
            strIngredient12,
            strIngredient13,
            strIngredient14,
            strIngredient15]
    }
    
    // Creating measures array
    func getStrMeasures() -> [String?] {
        return [
            strMeasure1,
            strMeasure2,
            strMeasure3,
            strMeasure4,
            strMeasure5,
            strMeasure6,
            strMeasure7,
            strMeasure8,
            strMeasure9,
            strMeasure10,
            strMeasure11,
            strMeasure12,
            strMeasure13,
            strMeasure14,
            strMeasure15]
    }
    
    /*
     - getDisplayIngredientsWithMeasures()
     - This method is used here to create a text which maps both ingredients and measures
     */
    func getDisplayIngredientsWithMeasures() -> [String] {
        var finalArray: [String] = []
        for (ingredient, measure) in zip(getStrIngredientsArr(), getStrMeasures()) {
            
            guard let ingredientWrapped = ingredient,
                    !ingredientWrapped.isEmpty,
                    let measureWrapped = measure,
                    !measureWrapped.isEmpty else {
                continue
            }
            finalArray.append("\(ingredientWrapped) - \(measureWrapped)")
        }
        return finalArray
    }
}
