//
//  HostTags.swift
//  futon-v1
//
//  Created by Linh Dang on 3/31/24.
//

import SwiftUI
import WrappingHStack

struct HostTags: View {
    @Binding var currentState: Int
    @State var tags = [String]()
    
    var attributes = ["Clean", "Neat freak", "Extra bed", "Communal bathroom", "Private bathroom", "Great view", "Shoes off", "Elevator", "Couch", "Roommate", "Refrigerator"]
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
                Text("Add More Tags")
                    .font(.custom("BricolageGrotesque-Medium", size: 34))
                
                WrappingHStack(attributes, id: \.self, alignment: .center) { attribute in
                    attributeButton(tags: $tags, attribute: attribute)
                    }
                .frame(width: 350)
                .padding(.bottom, 20)
                
        
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
         
        }
    }
}

#Preview {
    HostTags(currentState: .constant(0))
}
