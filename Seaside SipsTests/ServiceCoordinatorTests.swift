//
//  ServiceCoordinatorTests.swift
//  Seaside SipsTests
//
//  Created by Ganesh Kumar on 18/03/24.
//

import XCTest
@testable import Seaside_Sips
import Combine

final class ServiceCoordinatorTests: XCTestCase {
    
    var sut: MockServiceCoordinator!
    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MockServiceCoordinator()
    }

    override func tearDownWithError() throws {
        sut = nil
        cancellables.removeAll()
        try super.tearDownWithError()
    }
    
    func testGetDrinksAPI() {
        var items: Drinks?
        let expecation = XCTestExpectation()
        sut.getDrinks(endPoint: .alcoholic)
            .sink { completion in
                switch completion {
                case .finished:
                    expecation.fulfill()
                case .failure:
                    XCTFail()
                }
            } receiveValue: { returnedItems in
                items = returnedItems
            }
            .store(in: &cancellables)

        wait(for: [expecation], timeout: 5)
        XCTAssertTrue(sut.isGetDrinksAPICalled)
        XCTAssertNotNil(items)
        XCTAssertEqual(items?.drinks?.count, Utility.shared.getAlcoholicListJson().drinks?.count)
    }
    
    func testGetDrinkDetailsByIdAPI() {
        var items: SingleDrink?
        let expecation = XCTestExpectation()
        sut.getDrinkDetailsById(drinkId: "12560")
            .sink { completion in
                switch completion {
                case .finished:
                    expecation.fulfill()
                case .failure:
                    XCTFail()
                }
            } receiveValue: { returnedItems in
                items = returnedItems
            }
            .store(in: &cancellables)

        wait(for: [expecation], timeout: 5)
        XCTAssertTrue(sut.isGetDrinkDetailsByIdAPICalled)
        XCTAssertNotNil(items)
        XCTAssertEqual(items?.drinks?.count, Utility.shared.getSingleDrinkJson().drinks?.count)
    }
    
    func testSearchDrinksByFirstLetterAPI() {
        var items: Drinks?
        let expecation = XCTestExpectation()
        sut.searchDrinksByFirstLetter(letter: "a")
            .sink { completion in
                switch completion {
                case .finished:
                    expecation.fulfill()
                case .failure:
                    XCTFail()
                }
            } receiveValue: { returnedItems in
                items = returnedItems
            }
            .store(in: &cancellables)

        wait(for: [expecation], timeout: 5)
        XCTAssertTrue(sut.isSearchDrinksByAPICalled)
        XCTAssertNotNil(items)
        XCTAssertEqual(items?.drinks?.count, Utility.shared.getAlcoholicListJson().drinks?.count)
    }
}
