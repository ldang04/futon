//
//  HostLocation .swift
//  futon-v1
//
//  Created by Linh Dang on 3/31/24.
//

import SwiftUI

struct HostLocation: View {
    @Binding var currentState: Int
    @State var showPopup = true
    @State var timeRemaining = 2
    @State var location = ""
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
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
                Text("Where are you located?")
                    .font(.custom("BricolageGrotesque-Medium", size: 32))
                    .padding(.bottom, 30)
                    .frame(width: 200)
                            
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.black)
                        .frame(width: 305, height: 50)
                    TextField("", text: $location)
                        .padding(.leading, 70)
                }
                .padding(.bottom, 15)
                
                Button {
                    currentState += 1
                } label: {
                    Text("Confirm")
                        .padding([.leading, .trailing], 20)
                        .padding([.top, .bottom], 10)
                        .foregroundStyle(.white)
                        .background(Color("futonDarkGray"))
                        .cornerRadius(20)
                }
                .padding(.top, 30)
            }
            
            if(timeRemaining != 0){ // initial popup
                PopUp(type: 1, showPopup: $showPopup)
            }
        }
        .onReceive(timer){ timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }
}

#Preview {
    HostLocation(currentState: .constant(0))
}
