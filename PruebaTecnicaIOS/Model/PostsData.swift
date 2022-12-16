//
//  PostsData.swift
//  PruebaTecnicaIOS
//
//  Created by Jeison Galeano on 16/12/22.
//

import Foundation

struct PostsData: Hashable, Codable, Identifiable {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String 
}
