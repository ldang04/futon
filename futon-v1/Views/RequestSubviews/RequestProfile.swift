//
//  RequestProfile.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI
import Kingfisher
import WrappingHStack

struct RequestProfile: View {
    var user: User
    
    @State var viewProfile = false
    
    var circleColorOuter: Color { // computed property

        if(viewProfile){
            return Color("futonPurple")
        }
        
        return Color.white
    }
    
    var circleColorInner: Color { // computed property

        if(viewProfile){
            return Color.white
        }
        
        return Color("futonPurple")
    }
    
    var body: some View {
        ZStack {
            Color(viewProfile ? "futonGray" : "futonPurple")
                .edgesIgnoringSafeArea(.all)
            
            Image(viewProfile ? "" : "futon_f")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 655, height: 1006)
                .offset(x: 0, y: -40)
                .colorMultiply(Color("futonLilac"))
                .opacity(0.2)
            
            Image(viewProfile ? "futon_logo_black" :
                "futon_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 87, height: nil)
                .padding(.bottom, 30)
                .offset(x: 0, y: -280)
            
            VStack {
                KFImage(user.pfpURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 170)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                          .stroke(circleColorInner, lineWidth: 3)
                      }
                    .overlay {
                        Circle()
                            .stroke(circleColorOuter, lineWidth: 3)
                          .frame(width: 176, height: 176)
                    }
                    .padding(.top, 40)
                
                if(viewProfile == false) { // default view
                    Group {
                        Text("Do you know \(user.name)?")
                            .font(.custom("BricolageGrotesque-Bold", size: 40))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 318)
                            .padding(.bottom, 1)
                        
                        Text("\(user.university) \(String(user.graduationYear))")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding(.bottom, 50)
                        
                        Button {
                            
                        } label: {
                            ZStack {
                                Text("Yes, start chat")
                                    .textCase(.uppercase)
                                    .foregroundColor(.white)
                                    .fontWeight(.medium)
                                
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.white)
                                    .frame(width: 189, height: 33)
                            }
                        }
                        
                        Button {
                            withAnimation {
                                viewProfile = true
                            }
                        } label: {
                            ZStack {
                                Text("No, view profile")
                                    .textCase(.uppercase)
                                    .foregroundColor(.white)
                                    .fontWeight(.medium)
                                
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.white)
                                    .frame(width: 189, height: 33)
                            }
                        }
                        
                    }
                }
                else {
                    Text(user.name)
                        .font(.custom("BricolageGrotesque-Regular", size: 40))
                        .foregroundColor(Color("futonBlack"))
                        .multilineTextAlignment(.center)
                        .frame(width: 318)
                        .padding(.bottom, 1)
                    
                    Text("\(user.university) \(String(user.graduationYear))")
                        .font(.system(size: 20))
                        .foregroundColor(Color("futonBlack"))
                        .padding(.bottom, 10)
      
                    WrappingHStack(user.tags, id: \.self, alignment: .center) { tag in
                        Text(tag)
                            .fontWeight(.medium)
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 10)
                            .font(.system(size: 15))
                            .background(Color("futonPurple"))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                            .padding(.bottom, 5)
                        }
                    .frame(width: 350)
                    .padding(.bottom, 20)
                    
                    Button { // @todo create chat screen
                        
                    } label: {
                        Text("Start chat")
                            .fontWeight(.medium)
                            .padding([.leading, .trailing], 25)
                            .padding([.top, .bottom], 10)
                            .font(.system(size: 20))
                            .background(Color("futonBlack"))
                            .foregroundColor(.white)
                            .cornerRadius(40)
                            .padding(.bottom, 5)
                    }
                }
                
            }
        }
    }
}

struct RequestProfile_Previews: PreviewProvider {
    static var previews: some View {
        RequestProfile(user: exampleUser4)
    }
}
