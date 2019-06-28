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
    weak var season:Season?
    
    // inicializadores
     init(title: String, date: Date, season: Season) {
        self.title = title
        self.date = date
        self.season = season
    }
    
}

extension Episode {
    var proxyEquality: String {
        return "\(title) \(season?.name)"
    }
    var proxyComparassion: String {
        return "\(title) \(season?.name)"
    }
}

extension Episode: Equatable {
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyEquality == rhs.proxyEquality
    }
    
}

extension Episode: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(season?.name)
    }
    
}

extension Episode: Comparable {
    static func < (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyComparassion < rhs.proxyComparassion
    }
    
}

extension Episode: CustomStringConvertible {
    var description: String {
        let formater = DateFormatter()
        formater.dateFormat = "dd/MM/yyyy"
        return formater.string(from: date)
    }
    
}
