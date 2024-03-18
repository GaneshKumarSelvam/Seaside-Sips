//
//  DrinkListView_UITests.swift
//  Seaside SipsUITests
//
//  Created by Ganesh Kumar on 18/03/24.
//

import XCTest

final class DrinkListView_UITests: XCTestCase {

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
    
    func test_DrinkListView_ListExistsForAlcoholic() {
        app.collectionViews["list-categoryList"].images["Alcoholic"].tap()
        let navBar = app.navigationBars["Alcoholic"]
        XCTAssertTrue(navBar.exists)
        checkIfListExists()
    }
    
    func test_DrinkListView_ListExistsForNon_Alcoholic() {
        app.collectionViews["list-categoryList"]/*@START_MENU_TOKEN@*/.images["Non_Alcoholic"]/*[[".cells",".buttons[\"Non-Alcoholic, Check out the most popular Non-Alcoholic drinks in our Seaside Sips!\"].images[\"Non_Alcoholic\"]",".images[\"Non_Alcoholic\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Non-Alcoholic"].staticTexts["Non-Alcoholic"].tap()
        let navBar = app.navigationBars["Non-Alcoholic"]
        XCTAssertTrue(navBar.exists)
        checkIfListExists()
    }
    
    func checkIfListExists() {
        let listView = app.checkAndReturnTheElement(searchElement: "list-drinkListScreen")
        
        if listView.waitForExistence(timeout: 5) {
            XCTAssertTrue(listView.exists, "The Drink list view exists")
        }  else {
            let progressView = app.checkAndReturnTheElement(searchElement: "progress-drinkListScreen")
            if progressView.exists {
                XCTAssertTrue(progressView.exists, "The Progress View exists")
            } else {
                let noData = app.checkAndReturnTheElement(searchElement: "contentUnAvailable-drinkListScreen")
                XCTAssertTrue(noData.exists, "The Content Unavailable view exists")
            }
        }
    }
}
