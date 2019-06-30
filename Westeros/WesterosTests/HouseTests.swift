

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {

    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    var starkURL: URL!
    var lannisterURL: URL!
    
    override func setUp() {
        starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        
        starkSigil = Sigil(description: "Lobo Huargo", image: UIImage())
        lannisterSigil = Sigil(description: "León Rampante", image: UIImage())
        
        starkHouse = House(
            name: "Stark",
            sigil: starkSigil,
            words: "Se acerca el invierno",
            url: starkURL
        )
        
        lannisterHouse = House(
            name: "Lannister",
            sigil: lannisterSigil,
            words: "Oye mi rugido",
            url: lannisterURL
        )
        
        robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse, image: UIImage ())
        arya = Person(name: "Arya", house: starkHouse, image: UIImage ())
        tyrion = Person(name: "Tyrion", alias: "El gnomo", house: lannisterHouse, image: UIImage ())
    }

    override func tearDown() {
        
    }

    func testHouseExistence() {
        XCTAssertNotNil(starkHouse)
    }
    
    func testSigilExistence() {
        let starkSigil = Sigil(description: "Lobo Huargo", image: UIImage())
        XCTAssertNotNil(starkSigil)
    }
    
    // Given - When - Then
    func testHouseAddPersons() {
        XCTAssertEqual(starkHouse.count, 0)
        
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
    }
    
    func testHouseAddPersonsAtOnce() {
        starkHouse.add(persons: robb, arya, tyrion)
        XCTAssertEqual(starkHouse.count, 2)
    }
    
    func testHouseEquality() {
        // Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        // Igualdad
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: starkURL)
        
        
        XCTAssertEqual(starkHouse, jinxed)
        
        // Desigualdad
        XCTAssertNotEqual(lannisterHouse, starkHouse)
    }
    
    func testHouseComparison() {
        XCTAssertLessThan(lannisterHouse, starkHouse) // lannisterHouse < starkHouse
        XCTAssertGreaterThan(starkHouse, lannisterHouse)
    }
    
    func testHouseSortedMembersReturnsASortedListOfMembers() {
        
        starkHouse.add(persons: robb, arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        

        XCTAssertEqual(starkHouse.sortedMembers, [arya, robb])
        XCTAssertEqual(starkHouse.sortedMembers, starkHouse.sortedMembers.sorted())
    }
    
    
    // test correspondiente a la enum de la casa house
    func testHouseFindByName() {
        
        let casaLannister = House.Houses.Lannister
        XCTAssertEqual(casaLannister.house(name: .Lannister), "Lannister")
        
    }
}
