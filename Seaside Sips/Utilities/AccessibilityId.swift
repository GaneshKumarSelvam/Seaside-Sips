//
//  AccessibilityID.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 18/03/24.
//

import Foundation

struct AccessibilityId {
    // LaunchScreenView
    static let launchScreen_Image = "image-launchScreenImage"
    static let launchScreen_Title = "text-launchScreenTitle"
    static let launchScreen_Description = "text-launchScreen_Description"
    static let launchScreen_LetsGoButton = "button-launchScreen_LetsGoButton"
    
    // CategoryScreenView
    static let categoryScreen_List = "list-categoryList"
    
    // DrinkListView
    static let drinkListScreen_List = "list-drinkListScreen"
    static let drinkListScreen_Progress = "progress-drinkListScreen"
    static let drinkListScreen_ContentUnavailable = "contentUnAvailable-drinkListScreen"
    static let drinkListScreen_DrinkRow = "cell-drinkListScreen %@"
    
    // DrinkDetailView
    static let detailsScreen_ScrollView = "scrollView-detailsScreen"
    static let detailsScreen_Progress = "progress-detailsScreen"
    static let detailsScreen_ContentUnavailable = "contentUnAvailable-detailsScreen"
    static let detailsScreen_Ingredients = "text-detailsScreen_Ingredients"
    
    // SearchDrinkView
    static let searchDrinkScreen_List = "list-searchDrinkScreen_List"
    static let searchDrinkScreen_Progress = "progress-searchDrinkScreen_List"
    static let searchDrinkScreen_ContentUnavailable = "contentUnAvailable-searchDrinkScreen_List"
    static let searchDrinkScreen_DrinkRow = "cell-searchDrinkScreen_Listn %@"
}
