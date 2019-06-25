//
//  Season.swift
//  Westeros
//
//  Created by Jacobo Morales Diaz on 24/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation

typealias Episodes = Set<Episode>


final class Season {

    // propiedades
    let name: String
    let date: Date
    private var  _episodes: Episodes

    // inicializadores
     init(name: String, date: Date) {
        self.name = name
        self.date = date
        _episodes = Episodes()
    }
}

extension Season {
    var proxyEquality: String {
        return "\(name)"
    }
    var proxyComparassion: String {
        return name.uppercased()
    }
}

extension Season: Equatable {
    static func == (lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyEquality == rhs.proxyEquality
    }
    
}

extension Season: Comparable {
    static func < (lhs: Season, rhs: Season) -> Bool {
       return lhs.proxyComparassion < rhs.proxyComparassion
    }
    
}

extension Season: CustomStringConvertible {
    var description: String {
        return "\(date)"
    }
    
}

extension Season {
    var count : Int {
       return _episodes.count
    }
    
    func add (episode: Episode) {
        if self == episode.season{
            _episodes.insert(episode)
        }
    }
}
