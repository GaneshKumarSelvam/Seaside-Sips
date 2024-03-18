//
//  DrinkDetailViewModelTests.swift
//  Seaside SipsTests
//
//  Created by Ganesh Kumar on 18/03/24.
//

import XCTest
@testable import Seaside_Sips
import Combine

final class DrinkDetailViewModelTests: XCTestCase {

    var sut: DrinkDetailViewModel!
    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DrinkDetailViewModel(serviceCoordinator: MockServiceCoordinator())
    }

    override func tearDownWithError() throws {
        sut = nil
        cancellables.removeAll()
        try super.tearDownWithError()
    }
    
    func testFetchDrinkById_ShouldReturnData() {
        let expecation = XCTestExpectation(description: "testFetchDrinkById_ShouldReturnData")
        sut.fetchDrinkById(id: "12560")
        
        sut.signleDrink
            .drinks?.publisher.sink(receiveValue: { _ in
                expecation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expecation], timeout: 5)
        XCTAssertNotNil(sut.signleDrink.drinks)
    }
}
