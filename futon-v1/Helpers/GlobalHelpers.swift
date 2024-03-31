//
//  GlobalHelpers.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import Foundation

var guestRequests = [Request(
    id: "g",
    host: "5bc8393e-a260-40ce-9699-42edfd976212",
    guest: "96efcea6-e1ba-4c34-9f7a-4edb9ea74ca2",
    dates: "May 2 - May 4",
    reason: "SWE event"
),]

var hostRequests = [Request(
    id: "g",
    host: "5bc8393e-a260-40ce-9699-42edfd976212",
    guest: "96efcea6-e1ba-4c34-9f7a-4edb9ea74ca2",
    dates: "May 2 - May 4",
    reason: "SWE event"
),
    Request(
    id: "d",
    host: "5bc8393e-a260-40ce-9699-42edfd976212",
    guest: "96efcea6-e1ba-4c34-9f7a-4edb9ea74ca2",
    dates: "May 2 - May 4",
    reason: "SWE event"
),Request(
    id: "s",
    host: "5bc8393e-a260-40ce-9699-42edfd976212",
    guest: "96efcea6-e1ba-4c34-9f7a-4edb9ea74ca2",
    dates: "May 2 - May 4",
    reason: "SWE event"
)]
var mainUser = User(
    
    id: UUID().uuidString,
    name: "Peter",
    pfpURL: URL(string: "https://images.squarespace-cdn.com/content/v1/624a1c23d68c8a3f214fbe39/60e4886e-faed-4b4c-bec8-e758dc068526/isaac-olander-peter-parker-tobey-maguire-isaac-olander+%281%29.jpg")!,
    university: "Columbia University",
    graduationYear: 2026,
    photos: [
        URL(string: "https://i.ytimg.com/vi/0LbOdFhProo/maxresdefault.jpg")!],
    tags: ["123sq ft - Single", "Mattress", "Single-use Bathroom", "Shoes-Off", "Clean"],
    rating: 4.95,
    prompts: [UUID().uuidString],
    requests: [])

var userLists = [User(
    
    id: UUID().uuidString,
    name: "Peter",
    pfpURL: URL(string: "https://images.squarespace-cdn.com/content/v1/624a1c23d68c8a3f214fbe39/60e4886e-faed-4b4c-bec8-e758dc068526/isaac-olander-peter-parker-tobey-maguire-isaac-olander+%281%29.jpg")!,
    university: "Columbia University",
    graduationYear: 2026,
    photos: [
        URL(string: "https://i.ytimg.com/vi/0LbOdFhProo/maxresdefault.jpg")!],
    tags: ["123sq ft - Single", "Mattress", "Single-use Bathroom", "Shoes-Off", "Clean"],
    rating: 4.95,
    prompts: [UUID().uuidString],
    requests: [])]

var question = ""
var answer = ""
