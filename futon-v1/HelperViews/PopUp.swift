//
//  PopUp.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI

struct PopUp: View {
    var type: Int // 0: user, 1: host
    @Binding var showPopup: Bool
    
    var body: some View {
        ZStack {
            Color("futonNavy")
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {

                Image("futon_f")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                    .padding(.bottom, 10)
                Text("Let's create your \(type == 0 ? "user" : "host" ) profile!")
                    .foregroundColor(.white)
                    .font(.custom("BricolageGrotesque-ExtraBold", size: 34))
                    .multilineTextAlignment(.center)
                    .frame(width: 282)
            }
            
            Image("squiggle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .offset(x: -65, y: 95)
        }
        .transition(.move(edge: .bottom))
                      .animation(.easeInOut(duration: 0.5))
                      .onAppear {
                          DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                              withAnimation {
                                  showPopup = false
                              }
                          }
                      }
    }
}

struct PopUp_Previews: PreviewProvider {
    static var previews: some View {
        PopUp(type: 0, showPopup: .constant(true))
    }
}
