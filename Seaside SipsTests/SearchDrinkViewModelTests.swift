//
//  SearchDrinkViewModelTests.swift
//  Seaside SipsTests
//
//  Created by Ganesh Kumar on 18/03/24.
//

import XCTest
@testable import Seaside_Sips
import Combine

final class SearchDrinkViewModelTests: XCTestCase {
    
    var sut: SearchDrinkViewModel!
    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SearchDrinkViewModel(serviceCoordinator: MockServiceCoordinator())
    }

    override func tearDownWithError() throws {
        sut = nil
        cancellables.removeAll()
        try super.tearDownWithError()
    }
    
    func testFetchDrinkById_ShouldReturnData() {
        let expecation = XCTestExpectation(description: "testFetchDrinkById_ShouldReturnData")
        sut.fetchDrinks()
        sut.drinkModelArray
            .publisher.sink { _ in
            } receiveValue: { value in
                expecation.fulfill()
            }
            .store(in: &cancellables)
    
        wait(for: [expecation], timeout: 5)
        XCTAssertGreaterThan(sut.drinkModelArray.count, 0)
    }
}
