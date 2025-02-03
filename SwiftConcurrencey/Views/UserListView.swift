//
//  UserListView.swift
//  SwiftConcurrencey
//
//  Created by ray williams on 1/29/25.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject var vm = UsersListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.usersAndPosts) { usersAndPosts in
                    NavigationLink {
                        PostListView(posts: usersAndPosts.posts)
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(usersAndPosts.user.name)
                                    .font(.title)
                                Spacer()
                                Text("(\(usersAndPosts.numberOfPosts))")
                            }
                            Text(usersAndPosts.user.email)
                            
                        }
                    }
                }
            }
        }
        .navigationTitle("Users")
        .listStyle(.plain)
        .overlay{
            if vm.isLoading {
                ProgressView()
            }
        }
        .alert("Application Error", isPresented: $vm.showAlert, actions: {
            Button("OK"){}
        }, message: {
            if let errorMessage = vm.errorMessage {
                Text(errorMessage)
            }
        })
        .task {
            await vm.fetchUsers()
        }
    }
}

#Preview {
    UserListView()
}
