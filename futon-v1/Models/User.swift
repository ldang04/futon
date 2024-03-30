//
//  User.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import Foundation

struct User: Identifiable {
    var id: String
    var name: String
    var pfpURL: URL
    var university: String
    var graduationYear: Int
    var photos: [URL]? // optional
    var tags: [String]
    var rating: Double   
    var prompts: [Prompt]?
    
    var requests: [Request]? // optional
}

struct Prompt {
    var question: String
    var response: String
}

struct Request { // @todo change to host / visitor vars
    var user: User // user and host id
    var dates: String
    var reason: String
}
