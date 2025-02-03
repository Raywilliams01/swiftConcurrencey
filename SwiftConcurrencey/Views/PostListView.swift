//
//  PostListView.swift
//  SwiftConcurrencey
//
//  Created by ray williams on 2/2/25.
//

import SwiftUI

struct PostListView: View {
    @StateObject var vm = PostsListViewModel()
    var userId: Int?
    var body: some View {
            List {
                ForEach(vm.posts) { posts in
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
        .alert("Application Error", isPresented: $vm.showAlert, actions: {
            Button("OK"){}
        }, message: {
            if let errorMessage = vm.errorMessage {
                Text(errorMessage)
            }
        })
        .onAppear() {
            vm.userId = userId
            vm.fetchPosts()
        }
    }
}

#Preview {
    PostListView(userId: 1)
}
