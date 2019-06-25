//
//  Season.swift
//  Westeros
//
//  Created by Jacobo Morales Diaz on 24/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation

//typealias Episodes = Set<Episode>


final class Season {

    // propiedades
    let name: String
    let date: Date
    //private var  _episodes: Episodes

    // inicializadores
     init(name: String, date: Date) {
        self.name = name
        self.date = date
       // self._episodes = Episodes()
    }
    
}
