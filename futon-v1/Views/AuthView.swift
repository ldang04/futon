//
//  AuthView.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI

struct AuthView: View {
    @State var current = 0 { // @todo change current back to 0
        didSet {
            print("clicked")
        }
    }
    
    @State var isHosting = false
    
    @Binding var isLoggedIn: Bool
    
    // User object
    @State var name = ""
    @State var pfpURL = URL(string: "https://i.pinimg.com/originals/aa/c6/a1/aac6a12fd48d80fe1c1d7e4f87505589.jpg")
    @State var university = ""
    @State var graduationYear = 0
    @State var tags = [String]()
    @State var prompts = [Prompt]()
    
    var body: some View {
        VStack<AnyView> {
            switch current {
            case 0:
                    return AnyView(Start(currentState: $current))
                case 1:
                    return AnyView(Login(currentState: $current, isLoggedIn: $isLoggedIn))
                case 2:
                    return AnyView(Register(currentState: $current))
                case 3:
                    return AnyView(Connect(currentState: $current))
                case 4:
                    return AnyView(HostQ(currentState: $current, isHosting: $isHosting))
                case 5:
                    return AnyView(UserInfo(currentState: $current, tags: $tags))
                case 6:
                    return AnyView(UserAbout(currentState: $current)) // UserAbout now takes the place of UserBio
                case 7:
                    return AnyView(HostLocation(currentState: $current))
                case 8:
                    return AnyView(HostRoom(currentState: $current))
                case 9:
                    return AnyView(HostTags(currentState: $current))
                case 10:
                    return AnyView(HostPhotos(currentState: $current))
                case 11:
                    return AnyView(HostPrompt(currentState: $current))
                case 12:
                    return AnyView(HostResponse(currentState: $current))
                default:
                    return AnyView(Start(currentState: $current))
            }
        }
    }
}

struct UserBio: View {
    @Binding var currentState: Int
    var body: some View {
        ZStack {
            Text("UserPopUp")
        }
    }
}

struct HostLocation: View {
    @Binding var currentState: Int
    var body: some View {
        ZStack {
            Text("HostLocation")
        }
    }
}

struct HostRoom: View {
    @Binding var currentState: Int
    var body: some View {
        ZStack {
            Text("HostRoom")
        }
    }
}

struct HostTags: View {
    @Binding var currentState: Int
    var body: some View {
        ZStack {
            Text("HostTags")
        }
    }
}

struct HostPhotos: View {
    @Binding var currentState: Int
    var body: some View {
        ZStack {
            Text("HostPhotos")
        }
    }
}

struct HostPrompt: View {
    @Binding var currentState: Int
    var body: some View {
        ZStack {
            Text("HostPrompt")
        }
    }
}

struct HostResponse: View {
    @Binding var currentState: Int
    var body: some View {
        ZStack {
            Text("HostResponse")
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(isLoggedIn: .constant(false))
    }
}

