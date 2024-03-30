//
//  HostQ.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//
import SwiftUI

struct HostQ: View {
    @Binding var currentState: Int
    @Binding var isHosting: Bool
    
    var body: some View {
        ZStack {
            Image("futon_f_yellow")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 590, height: 1006)
                .offset(x: 0, y: -40)
            
            
            Button { // back button
                withAnimation {
                    currentState = 3
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
                Text("Would you ever be down to host?")
                    .font(.custom("BricolageGrotesque-Bold", size: 32))
                    .foregroundColor(Color("futonNavy"))
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                
                
                HStack {
                    Button {
                        // @future add connect functionality
                        isHosting = true // change isHosting
                        currentState += 1
                    } label: {
                        ZStack {
                            Text("Yes")
                                .font(.custom("BricolageGrotesque-Regular", size: 18))
                                .foregroundColor(Color("futonNavy"))
                            
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color("futonNavy"))
                                .frame(width: 113, height: 48)
                            
                        }
                    }
                    
                    Button {
                        // @future add connect functionality
                        currentState += 1
                    } label: {
                        ZStack {
                            Text("No")
                                .font(.custom("BricolageGrotesque-Regular", size: 18))
                                .foregroundColor(Color("futonNavy"))
                            
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color("futonNavy"))
                                .frame(width: 113, height: 48)
                            
                        }
                    }
                }
            }
        
        }
    }
}

struct HostQ_Previews: PreviewProvider {
    static var previews: some View {
        HostQ(currentState: .constant(4), isHosting: .constant(false))
    }
}
