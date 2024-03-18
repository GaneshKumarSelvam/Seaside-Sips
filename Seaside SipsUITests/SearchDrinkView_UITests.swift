//
//  SearchDrinkView_UITests.swift
//  Seaside SipsUITests
//
//  Created by Ganesh Kumar on 18/03/24.
//

import XCTest

final class SearchDrinkView_UITests: XCTestCase {
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app.setLaunchClicked()
        app.launch()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_SearchDrinkView_NoItemsFound() {
        app.collectionViews["list-categoryList"].swipeUp()
        app.collectionViews["list-categoryList"].images["Search"].tap()
        let navBar = app.navigationBars["Search"]
        XCTAssertTrue(navBar.exists)
        checkIfListExists()
    }
    
    func test_SearchDrinkView_WithItems() {
        
        app.collectionViews["list-categoryList"].swipeUp()
        app.collectionViews["list-categoryList"].images["Search"].tap()
        app.navigationBars["Search"].searchFields["Type first letter to search"].tap()
        app.keys["A"].tap()
        checkIfListExists()
    }
    
    func checkIfListExists() {
        let listView = app.checkAndReturnTheElement(searchElement: "list-searchDrinkScreen_List")
        
        if listView.waitForExistence(timeout: 5) {
            XCTAssertTrue(listView.exists, "The Drink list View exists")
        }  else {
            let progressView = app.checkAndReturnTheElement(searchElement: "progress-searchDrinkScreen_List")
            if progressView.exists {
                XCTAssertTrue(progressView.exists, "The Progress View exists")
            } else {
                let noData = app.checkAndReturnTheElement(searchElement: "contentUnAvailable-searchDrinkScreen_List")
                XCTAssertTrue(noData.exists, "The Content Unavailable view exists")
            }
        }
    }
}
