//
//  auth.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import Foundation
import Supabase

// log in function

let supabaseUrl = URL(string: "https://vatwrdnuldqstytgpsik.supabase.co")!
let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZhdHdyZG51bGRxc3R5dGdwc2lrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE4MDc5MTUsImV4cCI6MjAyNzM4MzkxNX0.CEz_Kt_8ye3LzBM5M0rEQEyrukIjYpkdp54sFjlQqh0"

func createUser(user: User, prompt: String, answer: String) async {
    let client = SupabaseClient(supabaseURL: supabaseUrl, supabaseKey: supabaseKey)
    do {
        let response = try await client.database
            .from("Users")
            .insert(user)
            .execute()
        print("User created successfully.")
        
        let response2 = try await client.database
            .from("Prompts")
            .insert(
                Prompt(
                id: user.prompts,
                prompt: prompt,
                answer: answer)
            )
            .execute()
        print("Prompt created successfully.")
        
    } catch {
        print("Error creating user.")
    }
}

func getUserWithId(id: String) async -> User? {
    let client = SupabaseClient(supabaseURL: supabaseUrl, supabaseKey: supabaseKey)
    do {
        let users: [User] = try await client.database
          .from("Users")
          .select()
          .eq("id", value: id)
          .execute()
          .value
        print("Got user successfully", users[0].name)
        return users[0]
    } catch {
        print("Error getting user: \(error)")
    }
    return nil
}

func getPromptWithUserId(id: String) async -> Prompt? {
    let client = SupabaseClient(supabaseURL: supabaseUrl, supabaseKey: supabaseKey)
    do {
        let users: [User] = try await client.database
          .from("Users")
          .select()
          .eq("id", value: id)
          .execute()
          .value
        let prompt: [Prompt] = try await client.database
            .from("Prompts")
            .select()
            .eq("id", value: users[0].prompts)
            .execute()
            .value
        print("Got prompt successfully")
        return prompt[0]
    } catch {
        print("Error getting prompt: \(error)")
    }
    return nil
}

func addRequest(request: Request) async {
    let client = SupabaseClient(supabaseURL: supabaseUrl, supabaseKey: supabaseKey)
    do {
        let response = try await client.database
            .from("Requests")
            .insert(request)
            .execute()
        print("Request created successfully.")
        
        let host = try await getUserWithId(id: request.host)
        var hostRequests = host?.requests ?? []
        hostRequests.append(request.id)
        
        try await client.database
          .from("Users")
          .update(["requests": hostRequests])
          .eq("id", value: request.host)
          .execute()
        
        let guest = try await getUserWithId(id: request.guest)
        var guestRequests = guest?.requests ?? []
        guestRequests.append(request.id)
        
        try await client.database
          .from("Users")
          .update(["requests": guestRequests])
          .eq("id", value: request.guest)
          .execute()
        
        print("User requests (host and guest) updated successfully")
        
    } catch {
        print("Error adding request: \(error)")
    }
}

func getRequestsAsHost(id: String) async -> [Request]? {
    let client = SupabaseClient(supabaseURL: supabaseUrl, supabaseKey: supabaseKey)
    do {
        let requests: [Request] = try await client.database
          .from("Requests")
          .select()
          .eq("host", value: id)
          .execute()
          .value
        print("Got requests successfully")
        return requests
    } catch {
        print("Error getting requests: \(error)")
    }
    return nil
}

func getRequestsAsGuest(id: String) async -> [Request]? {
    let client = SupabaseClient(supabaseURL: supabaseUrl, supabaseKey: supabaseKey)
    do {
        let requests: [Request] = try await client.database
          .from("Requests")
          .select()
          .eq("guest", value: id)
          .execute()
          .value
        print("Got requests successfully")
        return requests
    } catch {
        print("Error getting requests: \(error)")
    }
    return nil
}

func getUsersBySchool(school: String) async -> [User]? {
    let client = SupabaseClient(supabaseURL: supabaseUrl, supabaseKey: supabaseKey)
    do {
        let users: [User] = try await client.database
          .from("Users")
          .select()
          .eq("university", value: school)
          .execute()
          .value
        print("Got users successfully")
        return users
    } catch {
        print("Error getting users: \(error)")
    }
    return nil
}
