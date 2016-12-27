//
//  FipeOfertasUITests.swift
//  FipeOfertasUITests
//
//  Created by Douglas Salazar on 03/12/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import XCTest

class FipeOfertasUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    
    func testFipeOfertas(){
        
        let app = XCUIApplication()
        app.launch()
        app.pickerWheels.element.adjust(toPickerWheelValue: "FIAT")
        
        XCUIApplication().buttons["btnPesquisar"].tap()
        
        //XCTAssertEqual(app.tables.cells.count, 3)
        
        
        app.tables.cells.element(boundBy: 16).tap()
        app.tables.cells.element(boundBy: 0).tap()
        app.tables.cells.element(boundBy: 0).tap()
        
        

        
        
        //XCTAssert(app.staticTexts["Darth Maul"].exists, "lblName")
        //XCTAssert(app.images["darth_maul"].exists, "imgPhoto")
        
        //app.navigationBars["Episode I"].buttons["Star Wars"].tap()
        
        
        
        

        
        
    }
    
    func testPrototipo(){
        
        let app = XCUIApplication()
        app.pickerWheels["AUDI"].tap()
        app.buttons["btnPesquisar"].tap()
        
    }
    
}
