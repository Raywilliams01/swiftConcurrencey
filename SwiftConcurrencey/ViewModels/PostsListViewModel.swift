//
//  PostsListViewModel.swift
//  SwiftConcurrencey
//
//  Created by ray williams on 2/2/25.
//

import Foundation

class PostsListViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var showAlert = false
    @Published var errorMessage: String?
    var isLoading = false
    
    var userId: Int?
    
    
    func fetchPosts(){
        self.isLoading.toggle()
        if let userId = userId {
            let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users/\(userId)/posts")
            apiService.getJSON { (result: Result<[Post], APIError>) in
                defer {
                    DispatchQueue.main.async {
                        self.isLoading.toggle()
                    }
                }
                switch result {
                    case .success(let posts):
                        DispatchQueue.main.async {
                            self.posts = posts
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
    
}
