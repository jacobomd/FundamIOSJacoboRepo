//
//  Repository.swift
//  Westeros
//
//  Created by Alexandre Freire on 13/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

final class Repository {
    
    static let local = LocalFactory()
}

protocol HouseFactory {
    var houses: [House] { get }
    
    func house(named: String) -> House?
    
    typealias HouseFilter = (House) -> Bool  // (Tipo param) -> Tipo return
    func houses(filteredBy: HouseFilter) -> [House]
}

final class LocalFactory: HouseFactory {

    // Value of type '[house]' has no member 'count'
    var houses: [House] {
        
        // Me creo las casas
        let starkSigil = Sigil(description: "Lobo Huargo", image: UIImage(named: "stark")!)
        let lannisterSigil = Sigil(description: "León Rampante", image: UIImage(named: "lannister")!)
        let targaryenSigil = Sigil(description: "Dragón tricéfalo", image: UIImage(named: "targaryen")!)
        
        let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
        
        let lannisterHouse = House(
            name: "Lannister",
            sigil: lannisterSigil,
            words: "Oye mi rugido",
            url: lannisterURL
        )
        
        let starkHouse = House(
            name: "Stark",
            sigil: starkSigil,
            words: "Se acerca el invierno",
            url: starkURL
        )
        
        let targaryenHouse = House(
            name: "Targaryen",
            sigil: targaryenSigil,
            words: "Fuego Y Sangre",
            url: targaryenURL
        )
        
        // Add characters
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let dani = Person(name: "Daenerys", alias: "La Madre de Dragones", house: targaryenHouse)
        
        starkHouse.add(persons: arya, robb)
    
        lannisterHouse.add(persons: tyrion, jaime, cersei)

        targaryenHouse.add(person: dani)
        
        return [starkHouse, lannisterHouse, targaryenHouse].sorted()
    }
    
    func house(named name: String) -> House? {
        return houses.first { $0.name.uppercased() == name.uppercased() } // filter + first
    }
    
    func houses(filteredBy theFilter: (House) -> Bool) -> [House] {
        return houses.filter(theFilter) // 🤯
    }
    
}
