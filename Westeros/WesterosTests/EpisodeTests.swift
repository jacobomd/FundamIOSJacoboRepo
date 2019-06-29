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
    
    var season1 : Season!
    var season2 : Season!
    var season3 : Season!
    
    var episode1Season1 : Episode!
    var episode2Season1 : Episode!
    var episode1Season2 : Episode!
    var episode2Season2 : Episode!

    override func setUp() {
        
        season1 = Season(name: "Temporada 1", date: returnDate("19/06/2011"), resumen: "1111", image: UIImage ())
        season2 = Season(name: "Temporada 2", date: returnDate("03/06/2012"), resumen: "2222", image: UIImage ())
        season3 = Season(name: "Temporada 3", date: returnDate("09/06/2013"), resumen: "3333", image: UIImage ())
        
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

    func testEpisodeExistence () {
        XCTAssertNotNil(episode1Season1)
        
    }

    func testEpisodeConformsToHashable() {
        XCTAssertNotNil(episode1Season1.hashValue)
    }
    
    func testEpisodeEquality() {
        // 1. Identidad
        XCTAssertEqual(episode2Season1, episode2Season1)
        
        // 2. Igualdad
        let episodeTest = Episode(title: "The Kingsroad", date: returnDate("01/05/2011"), season: season1)
        XCTAssertEqual(episode2Season1, episodeTest)
        
        // 3. Desigualdad
        XCTAssertNotEqual(episode2Season1, episode2Season2)
    }
    
    func testEpisodeCustomStringConvertible () {
        // comparacion entre un date convertido a string y un string
        let dateTest = returnDate("08/04/2012").description
        XCTAssertEqual(episode2Season2.date.description, dateTest)
    }
}
