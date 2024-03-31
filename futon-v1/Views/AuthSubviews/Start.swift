//
//  Start.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI

struct Start: View {
    @State var started = false
    @Binding var currentState: Int
    
    var body: some View {
        ZStack {
            Color("futonPurple")
                .edgesIgnoringSafeArea(.all)
            
            Image("futon_f")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 655, height: 1006)
                .offset(x: 0, y: -40)
                .colorMultiply(Color("futonLilac"))
                .opacity(started ? 0 : 0.2)
            
            VStack { // content
                Image("futon_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 210, height: nil)
                    .padding(.bottom, 10)
    
                
                if(started == false){ // get started detail
                    VStack {
                        Text("Learn new things. \nMeet new people.\ngrab a futon.")
                            .textCase(.uppercase)
                            .font(.custom("BricolageGrotesque-Regular", size: 20))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .frame(width: 302, height: nil)
                            .padding(.bottom, 50)
                        
                        Button {
                            withAnimation {
                                self.started.toggle()
                            }
                        } label: {
                            Text("Get Started")
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
                    .transition(.opacity)
                    
                } else { // login / register option
                    VStack {
                        Button { // login
                            currentState = 1
                        } label: {
                            ZStack{
                                Text("")
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.white)
                                            .frame(width: 304, height: 37)
                                    )
                                
                                Text("Login")
                                    .foregroundColor(Color("futonPurple"))
                                    .font(.system(size: 17))
                                    .fontWeight(.medium)
                                    .padding([.top, .bottom], 7)
                                    .padding([.leading, .trailing], 15)
                                    
                            }
                        }
                        .padding(.bottom, 10)
                        
                        Button { // register
                            currentState = 2
                        } label: {
                            ZStack{
                                Text("")
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.white)
                                            .frame(width: 304, height: 37)
                                    )
                                
                                Text("Register")
                                    .foregroundColor(Color("futonPurple"))
                                    .font(.system(size: 17))
                                    .fontWeight(.medium)
                                    .padding([.top, .bottom], 7)
                                    .padding([.leading, .trailing], 15)
                                    
                            }
                        }
                    }
                    .transition(.opacity)
                    .padding(.top, 20)
                
                }
            }
            
            if(started == true){
                Button { // back button
                    withAnimation {
                        self.started.toggle()
                    }
                } label: {
                    Text("\(Image(systemName: "chevron.left"))")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .font(.system(size: 30))
                }
                .offset(x: -160, y: -350)
                .transition(.opacity)
            }
        }
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start(currentState: .constant(0))
    }
}
