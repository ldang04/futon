//
//  Login.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI

struct Login: View {
    @Binding var currentState: Int
    @Binding var isLoggedIn: Bool {
        didSet {
            if(isLoggedIn == false){
                error = true
            }
        }
    }
    
    @State var email = ""
    @State var password = ""
    @State var error = false
    
    var body: some View {
        ZStack {
            Color("futonPurple")
                .edgesIgnoringSafeArea(.all)
            
            Button { // back button
                withAnimation {
                    currentState -= 1
                }
            } label: {
                Text("\(Image(systemName: "chevron.left"))")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .font(.system(size: 30))
            }
            .offset(x: -160, y: -350)

            Image("futon_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 87, height: nil)
                .padding(.bottom, 30)
                .offset(x: 0, y: -280)
            
            VStack {
                VStack {
                    HStack {
                        Text("Login")
                            .font(.custom("BricolageGrotesque-Regular", size: 36))
                            .fontWeight(.medium)
                            .padding(.bottom, 15)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Email")
                            .foregroundColor(.white)
                        .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    
                    // email textfield
                    TextField("", text: $email)
                        .padding(.leading, 10)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white)
                                .frame(width: 310, height: 37)
                        )
                        .padding(.bottom, 10)
                    
                    HStack {
                        Text("Password")
                            .padding(.bottom, 10)
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    
                    // password textfield
                    TextField("", text: $password)
                        .padding(.leading, 10)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white)
                                .frame(width: 310, height: 37)
                        )
                        .padding(.bottom, 15)
                    
                    if(error){
                        HStack {
                            Text("Error: Invalid Credentials")
                                .padding(.bottom, 10)
                                .foregroundColor(.white)
                                .fontWeight(.medium)

                            Spacer()
                        }
                    }
                
                    socialBtns()
                    
                    Button {
                        // get substring
                        var nameSubstring = ""
                        if let idx = email.firstIndex(of: "@"){
                            nameSubstring = String(email[..<idx])
                        } else {
                            nameSubstring = "Steve"
                        }
                        
                        Task {
                            mainUser = await getUserWithName(name: nameSubstring)!
                            question = await getPromptWithUserId(id: mainUser.id)!.prompt
                            answer = await getPromptWithUserId(id: mainUser.id)!.answer
                            hostRequests = await getRequestsAsHost(id: mainUser.id)!
                            guestRequests = await getRequestsAsGuest(id: mainUser.id)!
                            userLists = await getUsersBySchool(school: "Monsters University")!
                        }
                        
                        isLoggedIn = true
                    } label: {
                        Text("Get started")
                            .foregroundColor(.white)
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .padding([.top, .bottom], 7)
                            .padding([.leading, .trailing], 15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.white, lineWidth: 1)
                            )
                    }
                }
                .frame(width: 305)
            }
        }
    }
}

struct socialBtns: View { // @future: add OAuth methods
    var body: some View {
        
        Text("OR")
            .foregroundColor(.white)
            .fontWeight(.medium)
            
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("futonNavy"))
                .frame(width: 310, height: 37)
            
            HStack {
//                Image("apple_logo")
                
                Spacer()
                
                Text("Continue with Apple")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                
                Spacer()
            }
            .frame(width: 280)
        }
        .padding(.bottom, 1)

        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("futonNavy"))
                .frame(width: 310, height: 37)
            
            HStack {
//                Image("google_logo")
                
                Spacer()
                
                Text("Continue with Google")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                
                Spacer()
            }
            .frame(width: 280)
        }
        .padding(.bottom, 1)
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("futonNavy"))
                .frame(width: 310, height: 37)
            
            HStack {
                Image("meta_logo") // @todo find better svg
                    
                Spacer()
                
                Text("Continue with Meta")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                
                Spacer()
            }
            .frame(width: 280)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(currentState: .constant(1), isLoggedIn: .constant(false))
    }
}
