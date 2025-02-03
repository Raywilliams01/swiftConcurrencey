//
//  UserListViewModel.swift
//  SwiftConcurrencey
//
//  Created by ray williams on 1/29/25.
//

import Foundation

class UsersListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?

    func fetchUsers(){
        isLoading.toggle()
        let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users")
        apiService.getJSON { (result: Result<[User], APIError>) in
            defer {
                DispatchQueue.main.async{
                    self.isLoading.toggle()
                }
            }
            switch result {
                case .success(let users):
                    DispatchQueue.main.async {
                        self.users = users
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.showAlert = true
                        self.errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this reproduce."
                    }
            }
        }
    }
}
