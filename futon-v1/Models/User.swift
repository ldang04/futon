//
//  User.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    var name: String
    var pfpURL: URL
    var university: String
    var graduationYear: Int
    var photos: [URL]
    var tags: [String]
    var rating: Double   
    var prompts: String
    var requests: [String?]
    
}

struct Prompt: Codable {
    var id: String
    var prompt: String
    var answer: String
}

struct Request: Codable { // @todo change to host / visitor vars
    var id: String
    var host: String
    var guest: String
    var dates: String
    var reason: String
}
