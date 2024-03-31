//
//  RequestView.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI

struct RequestView: View {
    var user: User
    
    @State var selected = 0 // custom picker selector
    
    var body: some View {
        ZStack {
            Color("futonLightGray")
                .edgesIgnoringSafeArea(.all)
            
            Image("futon_f")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 430, height: nil)
                .offset(x: 0, y: -40)
                .opacity(0.4)
                .colorMultiply(Color("futonLilac"))
            
            VStack {
                HStack {
                    Text("Conversations")
                        .font(.custom("BricolageGrotesque-Medium", size: 34))
                        .padding(.leading, 20)
                    Spacer()
                }
                    
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
                        .frame(width: 350, height: 36)
                    
                    HStack { // custom picker
                        Button {
                            selected = 0
                        } label: {
                            Text("Pending Stays")
                                .font(.custom("BricolageGrotesque-Medium", size: 15))
                                .padding([.leading, .trailing], 34)
                                .frame(height: 36)
                                .background(selected == 0 ? Color("futonYellow") : Color.white)
                                .cornerRadius(16)
                        }
                        
                        Spacer()
                        
                        Button {
                            selected = 1
                        } label: {
                            Text("Host Requests")
                                .font(.custom("BricolageGrotesque-Medium", size: 15))
                                .padding([.leading, .trailing], 33)
                                .frame(height: 36)
                                .background(selected == 1 ? Color("futonYellow") : Color.white)
                                .cornerRadius(16)
                        }
                    }
                    .foregroundColor(Color("futonBlack"))
                .frame(width: 350, height: 32)
                }
        
            
                // Requests
                if(selected == 1){
                    ScrollView { // dynamic forEach
                        VStack {
                            ForEach(hostRequests ?? [], id: \.self.reason){ request in
                                RequestBox(type: 1, request: request, id: request.guest)
                                    .padding(.bottom, 3)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.top, 10)
                } else {
                    ScrollView {
                        VStack {
                            ForEach(guestRequests ?? [], id: \.self.reason){ request in
                                RequestBox(type: 0, request: request, id: request.host)
                                    .padding(.bottom, 3)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.top, 10)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct RequestView_Previews: PreviewProvider {
    static var previews: some View {
        RequestView(user: mainUser)
    }
}
