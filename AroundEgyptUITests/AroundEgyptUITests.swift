//
//  AroundEgyptUITests.swift
//  AroundEgyptUITests
//
//  Created by Mark Mokhles on 06/09/2025.
//

import XCTest

//final class AroundEgyptUITests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    @MainActor
//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    @MainActor
//    func testLaunchPerformance() throws {
//        // This measures how long it takes to launch your application.
//        measure(metrics: [XCTApplicationLaunchMetric()]) {
//            XCUIApplication().launch()
//        }
//    }
//}
import XCTest

//final class AroundEgyptUITests: XCTestCase {
//    
//    var app: XCUIApplication!
//
//    override func setUp() {
//        super.setUp()
//        
//        continueAfterFailure = false
//        app = XCUIApplication()
//        app.launch()
//    }
//
//    override func tearDown() {
//        app = nil
//        super.tearDown()
//    }
//
//    func testSearchFlow() {
//        // Given
//        let searchField = app.textFields["Try \"Luxor\""] // placeholder text
//        
//        // When
//        XCTAssertTrue(searchField.waitForExistence(timeout: 5))
//        searchField.tap()
//        searchField.typeText("Luxor")
//        
//        // Simulate hitting the search button on keyboard
//        app.keyboards.buttons["Search"].tap()
//        
//        // Then
//        let resultCell = app.staticTexts["Luxor"] // assuming result title contains "Luxor"
//        XCTAssertTrue(resultCell.waitForExistence(timeout: 5))
//    }
//}

import XCTest

final class ExperiencesListViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        print(app.debugDescription)
    }

    func testCancelSearchRestoresHomeView() {
        let searchField = app.textFields["Try \"Luxor\""]
        searchField.tap()
        searchField.typeText("Cairo")
        
        app.buttons["Cancel"].tap()
        
        // HomeContentView should be back
        XCTAssertTrue(app.staticTexts["Welcome!"].exists) // assuming HomeContentView has this text
    }
    
    func testSearchFieldExists() {
        let app = XCUIApplication()
        app.launch()
        
        let searchField = app.textFields["SearchTextField"]
        
        // Wait up to 5 seconds for the TextField to appear
        XCTAssertTrue(searchField.waitForExistence(timeout: 5), "Search field not found")
    }
}
