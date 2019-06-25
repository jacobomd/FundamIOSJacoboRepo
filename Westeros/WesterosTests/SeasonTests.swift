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
    
    var episode1Season1 : Episode!
    var episode2Season1 : Episode!
    var episode1Season2 : Episode!
    var episode2Season2 : Episode!
    

    override func setUp() {
        
        season1 = Season(name: "Temporada 1", date: returnDate("19/06/2011"))
        season2 = Season(name: "Temporada 2", date: returnDate("03/06/2012"))
        season3 = Season(name: "Temporada 3", date: returnDate("09/06/2013"))
        
        episode1Season1 = Episode(title: "Winter is comming", date: returnDate("17/04/2011"), season: season1)
        episode2Season1 = Episode(title: "The Kingsroad", date: returnDate("24/04/2011"), season: season1)
        episode1Season2 = Episode(title: "The North Remembers", date: returnDate("01/04/2012"), season: season2)
        episode2Season2 = Episode(title: "The Night Lands", date: returnDate("08/04/2012"), season: season2)

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // funcion que retorna un date dado un string en formato fecha personalizado
    func returnDate (_ date: String) -> Date {
        let formato = DateFormatter()
        formato.dateFormat = "dd/MM/yyyy"
        let result = formato.date(from: date)
        return result!
        
    }

    func testSeasonExistence () {
        XCTAssertNotNil(season1)
    }
    func testSeasonAddEpisodes () {
        
        XCTAssertEqual(season1.count, 0)
        
        season1.add(episode: episode1Season1)
        season1.add(episode: episode2Season1)

        XCTAssertEqual(season1.count, 2)
        
        season2.add(episode: episode1Season2)
        season2.add(episode: episode2Season2)

        XCTAssertEqual(season2.count, 2)

    }
    func testSeasonEquality () {
        // identidad
        XCTAssertEqual(season1, season1)
        
        // igualdad
        let season3Test = Season(name: "Temporada 3", date: returnDate("09/06/2013"))
        XCTAssertEqual(season3, season3Test)
        
        // desigualdad
        let season2Test = Season(name: "Temporada 11", date: returnDate("09/06/2013"))
        XCTAssertNotEqual(season2, season2Test)
    }
    
    func testSeasonComparassion() {
        XCTAssertLessThan(season1, season2)
        XCTAssertGreaterThan(season3, season2)
    }
    
    func testSeasonCustomStringConvertible () {
        // comparacion entre un date convertido a string y un string
        let dateTest = returnDate("19/06/2011").description
        XCTAssertEqual(season1.date.description, dateTest)
    }

}
