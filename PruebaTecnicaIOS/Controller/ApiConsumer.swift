//
//  ApiConsumer.swift
//  PruebaTecnicaIOS
//
//  Created by Jeison Galeano on 16/12/22.
//

import Foundation

class ApiConsumer : ObservableObject{
    @Published var userDataJson = [UserData]()
    @Published var postsDataJson = [PostsData]()

    func loadData(completion:@escaping ([UserData]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let userData = try! JSONDecoder().decode([UserData].self, from: data!)
            print(userData)
            DispatchQueue.main.async {
                completion(userData)
            }
        }.resume()
        
    }
    
    func loadDataPosts(id: Int, completion:@escaping ([PostsData]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=\(id)") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let posts = try! JSONDecoder().decode([PostsData].self, from: data!)
            print(posts)
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
        
    }
}
