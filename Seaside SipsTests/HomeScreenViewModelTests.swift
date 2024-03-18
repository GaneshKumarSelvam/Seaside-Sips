//
//  HomeScreenViewModelTests.swift
//  Seaside SipsTests
//
//  Created by Ganesh Kumar on 18/03/24.
//

import XCTest
@testable import Seaside_Sips
import SwiftUI

final class HomeScreenViewModelTests: XCTestCase {
    
    var sut: HomeScreenViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = HomeScreenViewModel(homeScreenArray: [
            HomeScreenModel(type: .alcoholic, image: Image(Images.alcoholic_Image), title: AppContents.alcoholic, description: AppContents.alcoholic_Description),
            HomeScreenModel(type: .nonAlcoholic, image: Image(Images.NonAlcoholic_Image), title: AppContents.nonAlcoholic, description: AppContents.nonAlcoholic_Description)])
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testHomeScreenViewModelCount() {
        XCTAssertEqual(sut.homeScreenArray.count, 2)
    }
    
    func testHomeScreenViewModelType() {
        sut = HomeScreenViewModel(homeScreenArray: [
            HomeScreenModel(type: .alcoholic, image: Image(Images.alcoholic_Image), title: AppContents.alcoholic, description: AppContents.alcoholic_Description)])
        XCTAssertEqual(sut.homeScreenArray.count, 1)
        XCTAssertEqual(sut.homeScreenArray[0].type, .alcoholic)
        XCTAssertNotNil(sut.homeScreenArray[0].image)
        XCTAssertEqual(sut.homeScreenArray[0].title, AppContents.alcoholic)
    }

}
