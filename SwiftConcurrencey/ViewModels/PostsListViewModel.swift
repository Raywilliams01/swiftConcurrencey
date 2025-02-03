//
//  PostsListViewModel.swift
//  SwiftConcurrencey
//
//  Created by ray williams on 2/2/25.
//

import Foundation

class PostsListViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    var userId: Int?
    
    func fetchPosts(){
        if let userId = userId {
            let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users/\(userId)/posts")
            apiService.getJSON { (result: Result<[Post], APIError>) in
                switch result {
                    case .success(let posts):
                        DispatchQueue.main.async {
                            self.posts = posts
                        }
                    case .failure(let error):
                        print(error)
                }
            }
        }
    }
    
}
