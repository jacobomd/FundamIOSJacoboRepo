

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
    
    // Testeando la funcion de filtrado de las temporadas

    func testLocalFactoryHasSeasons() {
        let seasons = Repository.local.seasons
        XCTAssertNotNil(seasons)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfSeasons() {
        let seasons = Repository.local.seasons
        XCTAssertEqual(seasons, seasons.sorted())
    }
    
    func testLocalRepositorySeasonFiltering() {
        
        let filteredSeasonList = Repository.local.seasons(filteredBy: { season in
        season.count == 1 // true or false
        })
        XCTAssertEqual(filteredSeasonList.count, 0)
    }
    
    func testLocalRepositoryReturnsSeasonByNameCaseInsensitively() {
        let temporada1 = Repository.local.season(named: "Temporada 1")
        XCTAssertNotNil(temporada1)
        
        
        let nameFilter = { (season: Season) -> Bool in
           season.name == "Temporada 8"
        }
        
        let list = Repository.local.seasons(filteredBy: nameFilter)
        XCTAssertEqual(list.count, 1)
    
    }
    
}
