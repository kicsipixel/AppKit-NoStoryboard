//
//  Model.swift
//  OutlineView
//
//  Created by Szabolcs Tóth on 25.09.2026.
//

import Foundation

protocol Attributes: AnyObject {
    var name: String { get }
}

class Group: Attributes {
    let name: String
    var children: [Attributes]

    init(name: String, children: [Attributes] = []) {
        self.name = name
        self.children = children
    }
}

class Person: Attributes {
    let name: String
    let age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

enum SampleData {
    static let rootItems: [Attributes] = [
        Group(
            name: "Team A",
            children: [
                Person(name: "Alice", age: 30),
                Person(name: "Bob", age: 24),
            ]),
        Group(
            name: "Team B",
            children: [
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
        ),
    ]
}
