//
//  Register.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI

struct Register: View { // @todo connect responses with user model
    @Binding var currentState: Int
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @State var error = false
    
    var body: some View {
        ZStack {
            Color("futonPurple")
                .edgesIgnoringSafeArea(.all)
            
            Button { // back button
                withAnimation {
                    currentState = 0
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
                        Text("Register")
                            .font(.custom("BricolageGrotesque-Regular", size: 36))
                            .fontWeight(.medium)
                            .padding(.bottom, 15)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                    
                    HStack {
                        Text("Name")
                            .foregroundColor(.white)
                        .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    
                    // name textfield
                    TextField("", text: $name)
                        .padding(.leading, 10)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white)
                                .frame(width: 310, height: 37)
                        )
                        .padding(.bottom, 10)
                    
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
                    
                    Button { // @todo change to catch data
                        currentState = 3
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
struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register(currentState: .constant(2))
    }
}
