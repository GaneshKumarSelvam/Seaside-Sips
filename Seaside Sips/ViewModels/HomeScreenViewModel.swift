//
//  HomeScreenViewModel.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import Foundation
import SwiftUI

/*
 HomeScreenViewModel is used for showing the static content for Category page
 */

class HomeScreenViewModel {
    var homeScreenArray: [HomeScreenModel]
    
    init(homeScreenArray: [HomeScreenModel]) {
        self.homeScreenArray = homeScreenArray
    }
}
