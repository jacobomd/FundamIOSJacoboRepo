

import Foundation
import UIKit

typealias Episodes = Set<Episode>


final class Season {

    // propiedades
    let name: String
    let date: Date
    let resumen: String
    let image: UIImage
    private var  _episodes: Episodes

    // inicializadores
    init(name: String, date: Date, resumen: String, image: UIImage) {
        self.name = name
        self.date = date
        self.resumen = resumen
        self.image = image
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
        let formater = DateFormatter()
        formater.dateFormat = "dd/MM/yyyy"
        return formater.string(from: date)
    }
    
}

extension Season {
    var count : Int {
       return _episodes.count
    }
    
    var sortedEpisodess: [Episode] {
        return _episodes.sorted()
    }
    
    func add (episode: Episode) {
        if self == episode.season{
            _episodes.insert(episode)
        }
    }
    
    func add(episodes: Episode...) {

        for episode in episodes {
            add(episode: episode)
        }
    }
}


