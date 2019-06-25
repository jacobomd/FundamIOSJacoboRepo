//
//  Episode.swift
//  Westeros
//
//  Created by Jacobo Morales Diaz on 24/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation

final class Episode {

    // propiedades
    let title:String
    let date:Date
    let season:Season
    
    // inicializadores
    internal init(title: String, date: Date, season: Season) {
        self.title = title
        self.date = date
        self.season = season
    }
    
}
