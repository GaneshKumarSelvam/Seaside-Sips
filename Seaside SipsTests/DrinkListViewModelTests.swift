//
//  DrinkListViewModelTests.swift
//  Seaside SipsTests
//
//  Created by Ganesh Kumar on 18/03/24.
//

import XCTest
@testable import Seaside_Sips
import Combine

final class DrinkListViewModelTests: XCTestCase {
    
    var sut: DrinkListViewModel!
    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DrinkListViewModel(serviceCoordinator: MockServiceCoordinator())
    }
    
    override func tearDownWithError() throws {
        sut = nil
        cancellables.removeAll()
        try super.tearDownWithError()
    }
    
    func testFetchDrinks_ShouldReturnData() {
        let expecation = XCTestExpectation(description: "testFetchDrinks_ShouldReturnData")
        sut.fetchDrinks(type: .alcoholic)
        
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
