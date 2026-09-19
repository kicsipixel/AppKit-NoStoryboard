//
//  Person.swift
//  TableView
//
//  Created by Szabolcs Tóth on 18.09.2026.
//

import Foundation

struct Person {
    let name: String
    let age: Int
}

extension Person {
    static let testData = [
        Person(name: "Alice", age: 30),
        Person(name: "Bob", age: 24),
        Person(name: "Charlie", age: 35),
        Person(name: "Diana", age: 28),
        Person(name: "Ethan", age: 41),
        Person(name: "Fiona", age: 33),
        Person(name: "George", age: 27),
        Person(name: "Hannah", age: 22),
        Person(name: "Isaac", age: 38),
        Person(name: "Julia", age: 29),
        Person(name: "Kevin", age: 45),
        Person(name: "Laura", age: 31),
        Person(name: "Michael", age: 26),
        Person(name: "Nora", age: 36),
    ]
}
