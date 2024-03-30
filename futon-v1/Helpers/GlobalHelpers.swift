//
//  GlobalHelpers.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import Foundation

let sampleRequests = [
    Request(
        user: exampleUser3,
        dates: "March 29 - March 31", // @future use actual dates
        reason: "Need a bed for YHack!"
    ),
    Request(
        user: exampleUser4,
        dates: "March 30 - March 31",
        reason: "Long weekend in NYC"
    ),
    Request(
        user: exampleUser2,
        dates: "April 1 - April 2",
        reason: "Layover April 2"
    )
]

let sampleRequest =  Request(
    user: exampleUser3,
    dates: "March 29 - March 31", // @future use actual dates
    reason: "Need a bed for YHack!"
)

let exampleUser1 = User(
    id: UUID().uuidString,
    name: "James P. Sullivan",
    pfpURL: URL(string: "https://static.wikia.nocookie.net/disney/images/3/3c/Profile_-_Sulley.jpg/revision/latest?cb=20200817112818")!,
    university: "Monsters University",
    graduationYear: 2027,
    photos: [URL(string: "https://images.unsplash.com/photo-1486304873000-235643847519?q=80&w=3132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!, URL(string: "https://images.unsplash.com/photo-1463620910506-d0458143143e?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!],
    tags: ["154sq ft - Single", "Couch", "Communal Bathroom", "Shoes-Off", "Neat Freak"],
    rating: 4.95,
    prompts: [Prompt(question: "My #1 campus tip", response: "DO NOT– under any circumstances– try the Monster dining hall seafood 😵‍💫")],
    requests: sampleRequests
)

let exampleUser2 = User(
    id: UUID().uuidString,
    name: "Mike Wazowski",
    pfpURL: URL(string: "https://lumiere-a.akamaihd.net/v1/images/ct_videoportal_pixar_mikewazoski_ddt-16832_a98c6c65.jpeg?region=0,0,600,600")!,
    university: "Monsters University",
    graduationYear: 2027,
    photos: [URL(string: "https://images.unsplash.com/photo-1588750653876-52ad8a14af1e?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!, URL(string: "https://plus.unsplash.com/premium_photo-1683141149687-7c8de76522fe?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!],
    tags: ["154sq ft - Single", "Couch", "Shoes-Off", "Casual"],
    rating: 4.95)

let exampleUser3 = User(
    id: UUID().uuidString,
    name: "Randall Boggs",
    pfpURL: URL(string: "https://i.pinimg.com/originals/91/35/39/9135395e72cbc4e1f2738ec2070fe604.png")!,
    university: "Monsters University",
    graduationYear: 2026,
    photos: [URL(string: "https://images.unsplash.com/photo-1555854877-bab0e564b8d5?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!, URL(string: "https://images.unsplash.com/photo-1576495199011-eb94736d05d6?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!],
    tags: ["154sq ft - Single", "Couch", "Shoes-Off", "Casual"],
    rating: 4.95)

let exampleUser4 = User( // user profile
    id: UUID().uuidString,
    name: "Celia Mae",
    pfpURL: URL(string: "https://celiawiththesnakes.wordpress.com/wp-content/uploads/2019/02/0aec391e0a3b6f909f41984ecca738e8-1.jpg")!,
    university: "Monsters University",
    graduationYear: 2026,
    tags: ["Art History", "Museum-enthusiast", "Bookworm", "Based in NYC", "Monsters University Space Initiative", "Model UN", "Cat-lover"],
    rating: 4.9
)

let exampleUser5 = User(// user profile
    id: UUID().uuidString,
    name: "Don Carlton",
    pfpURL: URL(string: "https://i.pinimg.com/originals/a0/e6/c4/a0e6c4c77f49a8047ba6f1519c6f1b8b.jpg")!,
    university: "Monsters University",
    graduationYear: 2026,
    photos: [
        URL(string: "https://asiasociety.org/sites/default/files/styles/1200w/public/D/dormroom.jpg")!,
    ],
    tags: ["Computer Science", "Engineering School", "Tech-Savvy", "Extrovert", "Foodie"],
    rating: 4.7
)
