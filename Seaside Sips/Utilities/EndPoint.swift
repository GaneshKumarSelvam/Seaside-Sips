//
//  EndPoint.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import Foundation

enum Endpoint {
    static let baseURL = "https://www.thecocktaildb.com/api/json"
    case alcoholic
    case nonAlcoholic
    case alcoholDetails
    case alcoholSearch
    
    var path: String {
        switch self {
        case .alcoholic:
            return "/v1/1/filter.php?a=Alcoholic"
        case .nonAlcoholic:
            return "/v1/1/filter.php?a=Non_Alcoholic"
        case .alcoholDetails:
            return "/v1/1/lookup.php?i="
        case .alcoholSearch:
            return "/v1/1/search.php?f="
        }
    }
}
