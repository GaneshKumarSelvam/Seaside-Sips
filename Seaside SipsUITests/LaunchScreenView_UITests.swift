//
//  LaunchScreenView_UITests.swift
//  Seaside SipsUITests
//
//  Created by Ganesh Kumar on 18/03/24.
//

import XCTest

extension XCUIApplication {
    func setLaunchClicked(_ launchClicked: Bool = true) {
        launchArguments += ["-launchClicked", launchClicked ? "true" : "false"]
    }
    
    func checkAndReturnTheElement(searchElement: String) -> XCUIElement {
        let pred = NSPredicate(format: "identifier == '\(searchElement)'")
        let element = descendants(matching: .any).matching(pred).firstMatch
        return element
    }
}

final class LaunchScreenView_UITests: XCTestCase {

    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testTableInteraction() {
        app = XCUIApplication()
        app.setLaunchClicked()
        app.launch()
        let pred = NSPredicate(format: "identifier == 'list-categoryList'")
        let listView = app.descendants(matching: .any).matching(pred).firstMatch
        XCTAssertTrue(listView.exists, "The Category list exists")
    }
    
    func test_LaunchScreenView_LetsGo_shouldNotGoToCategoryPage() {
        app = XCUIApplication()
        app.setLaunchClicked(false)
        app.launch()
        app.images["image-launchScreenImage"].tap()
        app.staticTexts["text-launchScreenTitle"].tap()
        app.staticTexts["text-launchScreen_Description"].tap()
        let navBar = app.navigationBars["Seaside Sips"]
        XCTAssertFalse(navBar.exists)
    }
    
    func test_LaunchScreenView_LetsGo_shouldGoToCategoryPage() {
        app = XCUIApplication()
        app.setLaunchClicked()
        app.launch()
        let navBar = app.navigationBars["Seaside Sips"]
        let navBarExists = navBar.waitForExistence(timeout: 5)
        XCTAssertTrue(navBarExists)
    }
}
