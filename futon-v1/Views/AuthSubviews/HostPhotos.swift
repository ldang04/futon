//
//  HostPhotos.swift
//  futon-v1
//
//  Created by Linh Dang on 3/31/24.
//

import SwiftUI

struct HostPhotos: View {
    @Binding var currentState: Int
    
    var body: some View {
        ZStack {
            Color("futonLightGray")
                .edgesIgnoringSafeArea(.all)
            
            Image("futon_f_purple")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
                .offset(y: -280)
                
            Button { // back button
                withAnimation {
                    currentState -= 1
                }
            } label: {
                Text("\(Image(systemName: "chevron.left"))")
                    .foregroundColor(Color("futonNavy"))
                    .fontWeight(.medium)
                    .font(.system(size: 30))
            }
            .offset(x: -160, y: -350)
            
            VStack {
                Text("Upload Dorm Photos")
                    .font(.custom("BricolageGrotesque-Medium", size: 34))
                    .frame(width: 250)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 50)
                
                Button {
                    // attempt create user
                } label: {
                    Text("Camera Roll")
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 30)
                        .padding([.top, .bottom], 10)
                        .background(Color("futonPurple")) // Use Color to set the background color
                        .cornerRadius(20)
                        .padding([.leading, .trailing], 25)
                        .font(.custom("BricolageGrotesque-Medium", size: 17))
                        .padding(.top, 10)
            }
            }
        }
    }
}

#Preview {
    HostPhotos(currentState: .constant(0))
}
