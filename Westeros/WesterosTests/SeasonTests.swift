//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by Jacobo Morales Diaz on 24/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    
    var season1 : Season!
    var season2 : Season!
    var season3 : Season!

    override func setUp() {
        
        season1 = Season(name: "Temporada 1", date: returnDate("19/06/2011"))
        season2 = Season(name: "Temporada 2", date: returnDate("03/06/2012"))
        season3 = Season(name: "Temporada 3", date: returnDate("09/06/2013"))
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func returnDate (_ date: String) -> Date {
        let formato = DateFormatter()
        formato.dateFormat = "dd/MM/yyyy"
        let result = formato.date(from: date)
        return result!
        
    }

    func testSeasonExistence () {
        XCTAssertNotNil(season1)
    
    }

}
