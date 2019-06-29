//
//  Person.swift
//  Westeros
//
//  Created by Alexandre Freire on 11/06/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation
import UIKit

final class Person {
    let name: String
    let house: House
    let image: UIImage
    private let _alias: String? // O tiene un nil, o tiene un string
    
    var alias: String {
        return _alias ?? ""
    }
    
    var fullName: String {
        return "\(name) \(house.name)"
    }
    
    init(name: String, alias: String? = nil, house: House, image: UIImage) {
        self.name = name
        self._alias = alias 
        self.house = house
        self.image = image
    }
}

extension Person {
    var proxyForEquality: String {
        return "\(name) \(alias) \(house.name)"
    }
    
    var proxyForComparison: String {
        return fullName
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(alias)
        hasher.combine(house.name)
    }
}

extension Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
