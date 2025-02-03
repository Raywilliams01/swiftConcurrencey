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
                ForEach(vm.users) { user in
                    NavigationLink {
                        PostListView(userId: user.id)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.title)
                            Text(user.email)
                            
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
        .onAppear() {
            vm.fetchUsers()
        }
    }
}

#Preview {
    UserListView()
}
