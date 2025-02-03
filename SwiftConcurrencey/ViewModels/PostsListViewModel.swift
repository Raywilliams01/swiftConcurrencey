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
    
    @MainActor
    func fetchPosts() async {
        self.isLoading.toggle()
        if let userId = userId {
            let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users/\(userId)/posts")
            isLoading.toggle()
            defer {
                isLoading.toggle()
            }
            
            do {
                posts = try await apiService.getJSON()
            } catch {
                showAlert = true
                errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this reproduce."
            }
        }
    }
    
}
