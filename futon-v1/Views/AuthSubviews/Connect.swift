//
//  Connect.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//
import SwiftUI

struct Connect: View {
    @Binding var currentState: Int
    var body: some View {
        ZStack {
            Image("futon_f_yellow")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 590, height: 1006)
                .offset(x: 0, y: -40)
            
            
            Button { // back button
                withAnimation {
                    currentState = 2
                }
            } label: {
                Text("\(Image(systemName: "chevron.left"))")
                    .foregroundColor(Color("futonNavy"))
                    .fontWeight(.medium)
                    .font(.system(size: 30))
            }
            .offset(x: -160, y: -350)
            
            Image("futon_logo_navy")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 87, height: nil)
                .padding(.bottom, 30)
                .offset(x: 0, y: -280)
            
            VStack {
                Text("Connect to stay with/host your mutual friends and your network.")
                    .font(.custom("BricolageGrotesque-Bold", size: 32))
                    .foregroundColor(Color("futonNavy"))
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                
                Button { // linkedin button
                    // @future add connect functionality
                    currentState = 4
                } label: {
                    ZStack {
                        Text("Connect LinkedIn")
                            .font(.custom("BricolageGrotesque-Regular", size: 18))
                            .foregroundColor(Color("futonNavy"))
                        
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("futonNavy"))
                            .frame(width: 212, height: 48)
                        
                    }
                }
                
                Button {
                    // @future add connect functionality
                    currentState = 4
                } label: {
                    ZStack {
                        Text("Connect Instagram")
                            .font(.custom("BricolageGrotesque-Regular", size: 18))
                            .foregroundColor(Color("futonNavy"))
                        
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("futonNavy"))
                            .frame(width: 212, height: 48)
                        
                    }
                }
            }
        
        }
    }
}

struct Connect_Previews: PreviewProvider {
    static var previews: some View {
        Connect(currentState: .constant(4))
    }
}
