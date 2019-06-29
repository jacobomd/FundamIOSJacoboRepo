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
    var seasons: [Season] { get }
    
    func house(named: String) -> House?
    func season(named: String) -> Season?
    
    typealias HouseFilter = (House) -> Bool  // (Tipo param) -> Tipo return
    typealias SeasonFilter = (Season) -> Bool
    func houses(filteredBy: HouseFilter) -> [House]
    func seasons(filteredBy: SeasonFilter) -> [Season]
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
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse, image: UIImage(named: "robb")!)
        let arya = Person(name: "Arya", house: starkHouse, image: UIImage(named: "arya")!)
        let tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse, image: UIImage(named: "tyrion")!)
        let jaime = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse, image: UIImage(named: "jaime")!)
        let cersei = Person(name: "Cersei", house: lannisterHouse, image: UIImage(named: "cersei")!)
        let dani = Person(name: "Daenerys", alias: "La Madre de Dragones", house: targaryenHouse, image: UIImage(named: "dani")!)
        
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
    
    func returnDate (_ date: String) -> Date {
        let formato = DateFormatter()
        formato.dateFormat = "dd/MM/yyyy"
        let result = formato.date(from: date)
        return result!
        
    }
    
    var seasons: [Season] {
        
       // Añado las 8 temporadas que existen en la serie
        let temporada1 = Season(name: "Temporada 1", date: returnDate("19/06/2011"),
                                resumen: "La historia está fragmentada en varios escenarios: lo que sucede en Desembarco del Rey, lo que sucede en el resto del continente, lo que sucede en el muro y lo que sucede allende los mares."
            , image: UIImage(named: "season1")!)
        let temporada2 = Season(name: "Temporada 2", date: returnDate("03/06/2012"),
                                resumen: "Después del final de primera temporada, la guerra entre familias no ha hecho más que comenzar. En el Norte, Robb Stark se entera de la muerte de su padre Ned ...."
        , image: UIImage(named: "season2")!)
        let temporada3 = Season(name: "Temporada 3", date: returnDate("09/06/2013"),
                                resumen: "La guerra por el Trono de Hierro es inminente. Pero no solo tratarán de conquistarlo los vivos... ya que entran en el juego los Caminantes Blancos..."
        , image: UIImage(named: "season3")!)
        let temporada4 = Season(name: "Temporada 4", date: returnDate("15/06/2014"),
                                resumen: "Los Stark están más divididos que nunca. Sansa sigue atrapada en Desembarco del Rey a merced de los Lannister y de Joffrey ..."
        , image: UIImage(named: "season4")!)
        let temporada5 = Season(name: "Temporada 5", date: returnDate("14/06/2015"),
                                resumen: "Hay nuevo rey: Tommen, hermano de Joffrey e hijo de Cersei y Jaime Lannister. Para seguir manteniendo la alianza con la casa Tyrell, Tommen se casa con Margaery de la que se enamora ..."
        , image: UIImage(named: "season5")!)
        let temporada6 = Season(name: "Temporada 6", date: returnDate("26/06/2016"),
                                resumen: "¿Está Jon Snow muerto o no? Bueno, lo cierto es que sí. Pero ahí está Melisandre para solucionarlo todo y le resucita. Tras esta resurrección ..."
        , image: UIImage(named: "season6")!)
        let temporada7 = Season(name: "Temporada 7", date: returnDate("27/08/2017"),
                                resumen: "Cersei se ha convertido en Reina y es ella la que se sienta en el Trono de Hierro. Pero pocos están de acuerdo. Por un lado, Daenerys ha regresado ..."
        , image: UIImage(named: "season7")!)
        let temporada8 = Season(name: "Temporada 8", date: returnDate("19/05/2019"),
                                resumen: "La Gran Guerra ha llegado, el Muro ha caído y el ejército del Rey de la Noche marcha sobre Poniente. El final está aquí pero ..."
        , image: UIImage(named: "season8")!)
        
        // Añado todos los episodios de cada una de las temporadas
        
        // Temporada 1
        let episodio1Season1 = Episode(title: "Winter is Comming", date: returnDate("17/04/2011"), season: temporada1)
        let episodio2Season1 = Episode(title: "The Kingsroad", date: returnDate("24/04/2011"), season: temporada1)
        let episodio3Season1 = Episode(title: "Lord Snow", date: returnDate("01/05/2011"), season: temporada1)
        
        // Temporada 2
        let episodio1Season2 = Episode(title: "The North Remembers", date: returnDate("01/04/2012"), season: temporada2)
        let episodio2Season2 = Episode(title: "The Night Lands", date: returnDate("08/04/2012"), season: temporada2)
        let episodio3Season2 = Episode(title: "What Is Dead May Never Die", date: returnDate("15/04/2012"), season: temporada2)
        
        // Temporada 3
        let episodio1Season3 = Episode(title: "Valar Dohaeris", date: returnDate("31/03/2013"), season: temporada3)
        let episodio2Season3 = Episode(title: "Dark Wings, Dark Words", date: returnDate("07/04/2013"), season: temporada3)
        let episodio3Season3 = Episode(title: "Walk of Punishment", date: returnDate("14/04/2013"), season: temporada3)
        
        // Temporada 4
        let episodio1Season4 = Episode(title: "Two Swords", date: returnDate("06/04/2014"), season: temporada4)
        let episodio2Season4 = Episode(title: "The Lion and the Rose", date: returnDate("13/04/2014"), season: temporada4)
        let episodio3Season4 = Episode(title: "Breaker of Chains", date: returnDate("20/04/2014"), season: temporada4)
        
        // Temporada 5
        let episodio1Season5 = Episode(title: "The Words to Come", date: returnDate("12/04/2015"), season: temporada5)
        let episodio2Season5 = Episode(title: "The House of Black", date: returnDate("19/04/2015"), season: temporada5)
        let episodio3Season5 = Episode(title: "High Sparrow", date: returnDate("26/04/2015"), season: temporada5)
        
        // Temporada 6
        let episodio1Season6 = Episode(title: "The Red Woman", date: returnDate("24/04/2016"), season: temporada6)
        let episodio2Season6 = Episode(title: "Home", date: returnDate("01/05/2016"), season: temporada6)
        let episodio3Season6 = Episode(title: "Oathbreaker", date: returnDate("08/05/2016"), season: temporada6)
        
        // Temporada 7
        let episodio1Season7 = Episode(title: "Dragonstone", date: returnDate("16/07/2017"), season: temporada7)
        let episodio2Season7 = Episode(title: "Stormborn", date: returnDate("23/07/2017"), season: temporada7)
        let episodio3Season7 = Episode(title: "The Queen's Justice", date: returnDate("30/07/2017"), season: temporada7)
        
        // Temporada 8
        let episodio1Season8 = Episode(title: "Winterfell", date: returnDate("14/04/2019"), season: temporada8)
        let episodio2Season8 = Episode(title: "A Knight of the Seven Kingdoms", date: returnDate("21/04/2019"), season: temporada8)
        let episodio3Season8 = Episode(title: "The Long Night", date: returnDate("28/04/2019"), season: temporada8)
        
        temporada1.add(episodes: episodio1Season1, episodio2Season1, episodio3Season1)
        temporada2.add(episodes: episodio1Season2, episodio2Season2, episodio3Season2)
        temporada3.add(episodes: episodio1Season3, episodio2Season3, episodio3Season3)
        temporada4.add(episodes: episodio1Season4, episodio2Season4, episodio3Season4)
        temporada5.add(episodes: episodio1Season5, episodio2Season5, episodio3Season5)
        temporada6.add(episodes: episodio1Season6, episodio2Season6, episodio3Season6)
        temporada7.add(episodes: episodio1Season7, episodio2Season7, episodio3Season7)
        temporada8.add(episodes: episodio1Season8, episodio2Season8, episodio3Season8)

        
        return [temporada1, temporada2, temporada3, temporada4, temporada5, temporada6, temporada7, temporada8].sorted()
    }
    
    func seasons(filteredBy: (Season) -> Bool) -> [Season] {
        return seasons.filter(filteredBy)
    }
    
    func season(named name: String) -> Season? {
        return seasons.first { $0.name.uppercased() == name.uppercased() } // filter + first
    }
    
    
}
