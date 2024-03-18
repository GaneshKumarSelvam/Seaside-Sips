//
//  DynamicTypeSize.swift
//  Seaside Sips
//
//  Created by Ganesh Kumar on 17/03/24.
//

import Foundation
import SwiftUI

extension DynamicTypeSize {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .xSmall, .small, .medium:
            return 1.0
        case .large, .xLarge, .xxLarge, .xxxLarge:
            return 0.8
        default:
            return 0.01
        }
    }
}
