//
//  CategoryScreenView_UITests.swift
//  Seaside SipsUITests
//
//  Created by Ganesh Kumar on 18/03/24.
//

import XCTest

final class CategoryScreenView_UITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_CategoryScreenView_ListExists() {
        app = XCUIApplication()
        app.setLaunchClicked()
        app.launch()
        
        let navBar = app.navigationBars["Seaside Sips"]
        let navBarExists = navBar.waitForExistence(timeout: 5)
        XCTAssertTrue(navBarExists)
        let listView = app.checkAndReturnTheElement(searchElement: "list-categoryList")
        let listExists = listView.waitForExistence(timeout: 5)
        XCTAssertTrue(listExists)
    }
    
    func test_CategoryScreenView_List_AlcoholClicked() {
        app.collectionViews["list-categoryList"].images["Alcoholic"].tap()
        let navBar = app.navigationBars["Alcoholic"]
        XCTAssertTrue(navBar.exists)
    }
    
    func test_CategoryScreenView_List_NonAlcoholClicked() {
        app.collectionViews["list-categoryList"].images["Non_Alcoholic"].tap()
        let navBar = app.navigationBars["Non-Alcoholic"]
        XCTAssertTrue(navBar.exists)
    }
    
    func test_CategoryScreenView_List_SearchClicked() {
        app.collectionViews["list-categoryList"].swipeUp()
        app.collectionViews["list-categoryList"].images["Search"].tap()
        let navBar = app.navigationBars["Search"]
        XCTAssertTrue(navBar.exists)
    }
}
