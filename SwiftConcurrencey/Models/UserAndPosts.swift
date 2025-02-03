//
//  UserAndPost.swift
//  SwiftConcurrencey
//
//  Created by ray williams on 2/2/25.
//

import Foundation


struct UserAndPosts: Identifiable {
    var id = UUID()
    let user: User
    let posts: [Post]
    var numberOfPosts: Int {
        posts.count
    }
}
