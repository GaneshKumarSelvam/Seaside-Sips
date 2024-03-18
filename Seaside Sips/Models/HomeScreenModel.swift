//
//  HomeScreenModel.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import Foundation
import SwiftUI


/*
 HomeScreenModel is used for showing the static content for Category page
 */

struct HomeScreenModel: Identifiable {
    let id: String = UUID().uuidString
    var type: Utility.AlcoholTypes
    var image: Image
    var title: String
    var description: String
}
