//
//  PostListView.swift
//  SwiftConcurrencey
//
//  Created by ray williams on 2/2/25.
//

import SwiftUI

struct PostListView: View {
    var posts: [Post]
    var body: some View {
            List {
                ForEach(posts) { posts in
                    VStack(alignment: .leading) {
                        Text(posts.title)
                            .font(.headline)
                        Text(posts.body)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        .navigationTitle("Posts")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
    }
}

//#Preview {
//    PostListView()
//}
