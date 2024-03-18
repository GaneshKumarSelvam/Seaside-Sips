//
//  DrinkDetailView_UITests.swift
//  Seaside SipsUITests
//
//  Created by Ganesh Kumar on 18/03/24.
//

import XCTest

final class DrinkDetailView_UITests: XCTestCase {

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

    func test_DrinkDetailsView_ForSingleDrink() {
        app.collectionViews["list-categoryList"].images["Alcoholic"].tap()
        let navBar = app.navigationBars["Alcoholic"]
        XCTAssertTrue(navBar.exists)
        if checkIfListExists() {
            let cell = app.checkAndReturnTheElement(searchElement: "cell-drinkListScreen 0")
            if cell.exists {
                XCTAssertTrue(cell.exists)
                cell.tap()
                if checkIfDataIsLoadedInDetailScreen() {
                   let ingredientsLabel = app.checkAndReturnTheElement(searchElement: "text-detailsScreen_Ingredients")
                    XCTAssertTrue(ingredientsLabel.exists)
                }
            }
        }
        
    }
    
    func checkIfListExists() -> Bool {
        let listView = app.checkAndReturnTheElement(searchElement: "list-drinkListScreen")
        
        if listView.waitForExistence(timeout: 5) {
            XCTAssertTrue(listView.exists, "The Drink List View exists")
            return true
        }  else {
            let progressView = app.checkAndReturnTheElement(searchElement: "progress-drinkListScreen")
            if progressView.exists {
                XCTAssertTrue(progressView.exists, "The Progress View exists")
            } else {
                let noData = app.checkAndReturnTheElement(searchElement: "contentUnAvailable-drinkListScreen")
                XCTAssertTrue(noData.exists, "The Content Unavailable view exists")
            }
        }
        return false
    }
    
    func checkIfDataIsLoadedInDetailScreen() -> Bool {
        let scrollView = app.checkAndReturnTheElement(searchElement: "scrollView-detailsScreen")
        
        if scrollView.waitForExistence(timeout: 5) {
            XCTAssertTrue(scrollView.exists, "The data is loaded and Scrollview exists")
            return true
        }  else {
            let progressView = app.checkAndReturnTheElement(searchElement: "progress-detailsScreen")
            if progressView.exists {
                XCTAssertTrue(progressView.exists, "The Progress View exists")
            } else {
                let noData = app.checkAndReturnTheElement(searchElement: "contentUnAvailable-detailsScreen")
                XCTAssertTrue(noData.exists, "The Content Unavailable view exists")
            }
        }
        return false
    }
}
