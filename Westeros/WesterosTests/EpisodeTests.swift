//
//  EpisodeTests.swift
//  WesterosTests
//
//  Created by Jacobo Morales Diaz on 24/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {
    
    var episode1 : Episode!
    var episode2 : Episode!
    var episode3 : Episode!
    var episode4 : Episode!
    var seasion1 : Season!
    var seasion2 : Season!

    override func setUp() {
        seasion1 = Season(name: "Seasion 1", date: returnDate("17/04/2011"))
        
        episode1 = Episode(title: "Winter in comming", date: returnDate("17/04/2011"), season: seasion1)
        episode2 = Episode(title: "The Kingsroad", date: returnDate("24/04/2011"), season: seasion1)
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

    func testEpisodeExistence () {
        XCTAssertNotNil(episode1)
        
    }

}
