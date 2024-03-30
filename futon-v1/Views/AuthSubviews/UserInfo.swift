//
//  UserInfo.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI
import WrappingHStack

struct UserInfo: View {
    @Binding var currentState: Int
    @Binding var tags: [String]
    
    @State var timeRemaining = 2
    @State var showPopup = true
    
    var attributes = ["Introvert", "Bookworm", "STEM", "Humanities", "Extrovert", "Neat freak", "Singer", "Art-lover", "Animal-lover", "Vegetarian", "Athlete", "Musician", "Night owl", "Early bird", "Techy", "Foodie", "Ambivert", "Activist", "Comedian"]
    
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
                Text("Describe yourself")
                    .font(.custom("BricolageGrotesque-Medium", size: 34))
                
                WrappingHStack(attributes, id: \.self, alignment: .center) { attribute in
                    attributeButton(tags: $tags, attribute: attribute)
                    }
                .frame(width: 350)
                
                Button {
                    currentState += 1
                } label: {
                    Text("Confirm")
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 20)
                        .padding([.top, .bottom], 10)
                        .background(Color("futonDarkGray")) // Use Color to set the background color
                        .cornerRadius(20)
                        .padding([.leading, .trailing], 20)
                        .font(.custom("BricolageGrotesque-Medium", size: 17))
                        .padding(.top, 10)
                }
            }
         
            
            if(timeRemaining != 0){ // initial popup
                PopUp(type: 0, showPopup: $showPopup)
            }
            
        }
        .onReceive(timer){ timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }
}

struct attributeButton: View {
    @Binding var tags: [String]
    var attribute: String
    
    @State var selected = false
    
    var body: some View {
        Button {
            if(!selected){
                tags.append(attribute)
            } else {
                tags = tags.filter{ $0 != attribute }
            }
            
            selected.toggle()
        } label: {
            Text(attribute)
                .fontWeight(.medium)
                .padding([.leading, .trailing], 20)
                .padding([.top, .bottom], 10)
                .font(.system(size: 15))
                .background(selected ? Color("futonPurple") : Color.white.opacity(0))
                .foregroundColor(selected ? .white : Color("futonBlack"))
                .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(selected ? Color("futonPurple") : Color("futonBlack")))
                .padding(.bottom, 5)

        }
        .padding(.bottom, 5)
    }
}

struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo(currentState: .constant(0), tags: .constant([String]()))
    }
}
