//
//  User.swift
//  SwiftConcurrencey
//
//  Created by ray williams on 1/29/25.
//

// Source: https://jsonplaceholder.typicode.com/users


struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
