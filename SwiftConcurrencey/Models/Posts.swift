//
//  Posts.swift
//  SwiftConcurrencey
//
//  Created by ray williams on 1/29/25.
//

// Source: https://jsonplaceholder.typicode.com/posts

// Single Post: https://jsonplaceholder.typicode.com/users/1/posts

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
