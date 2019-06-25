//
//  RepositoryTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 13/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testLocalRepositoryExistence() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalFactoryHasHouses() {
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
    }
    
    func testLocalFactoryHasTheCorrectHouseCount() {
        let houses = Repository.local.houses
        XCTAssertEqual(houses.count, 3)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses() {
        let houses = Repository.local.houses
        XCTAssertEqual(houses, houses.sorted())
    }
    
    func testLocalRepositoryReturnsHouseByNameCaseInsensitively() {
        let stark = Repository.local.house(named: "Stark")
        XCTAssertNotNil(stark)
        
        let lannister = Repository.local.house(named: "lAnniStEr")
        XCTAssertNotNil(lannister)
        
        let keepcoding = Repository.local.house(named: "Keepcoding")
        XCTAssertNil(keepcoding)
    }
    
    func testLocalRepositoryHouseFiltering() {
        let filteredHouseList = Repository.local.houses(filteredBy: { house in
            house.count == 1 // true or false
        })

        XCTAssertEqual(filteredHouseList.count, 1)
        
        let wordsFilter = { (house: House) -> Bool in
            house.words == "Se acerca el verano"
        }
        
        let list = Repository.local.houses(filteredBy: wordsFilter)
        XCTAssertEqual(list.count, 0)
    }
}
