//
//  ProfileView.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI
import Kingfisher
import WrappingHStack

struct ProfileView: View {
    var user: User
    
    var body: some View {
        ScrollView {
            ZStack {
                // background F
                Image("futon_f")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 430, height: nil)
                    .offset(x: 0, y: -230)
                    .colorMultiply(Color("futonLilac"))
                
                VStack { // user profile
                    
                    BasicSection(user: user)
                        .padding(.bottom)
                    
                    InfoSection(user: user)
                        .padding([.leading, .trailing])
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color("futonLightGray"))
    }
}

struct BasicSection: View {
    var user: User
    
    var body: some View {
        VStack {
            KFImage(user.pfpURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 170)
                .clipShape(Circle())
                .overlay {
                    Circle()
                      .stroke(.white, lineWidth: 3)
                  }
                .overlay {
                    Circle()
                      .stroke(Color("futonPurple"), lineWidth: 3)
                      .frame(width: 176, height: 176)
                }
                .padding(.top, 40)
        
            Text(user.name)
                .font(.custom("BricolageGrotesque-Regular", size: 32))
                .fontWeight(.medium)
                .padding(.bottom, 1)
            
            Text("\(user.university) | \(String(user.graduationYear))")
                .font(.custom("BricolageGrotesque-Regular", size: 16))
            
            // Optional Icons
            HStack {
                Button {
                    // @todo add functionality
                } label: {
                    Image("instagram_icon")
                        .resizable()
                        .frame(width: 27, height: 27)
                }
                
                Button {
                    // @todo add functionality
                } label: {
                    Image("linkedin_icon")
                        .resizable()
                        .frame(width: 27, height: 27)
                }
            }
        }
    }
}

struct InfoSection: View {
    var user: User
    
    var body: some View {
        VStack {
            HStack {
                
            // @todo complete user wrapping
            WrappingHStack(user.tags, id: \.self) { tag in
                Text(tag)
                    .fontWeight(.medium)
                    .padding([.leading, .trailing], 20)
                    .padding([.top, .bottom], 3)
                    .font(.system(size: 12))
                    .background(Color("futonBlack"))
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    .padding(.bottom, 5)
                }
            .frame(width: 250)
                
            Spacer()
                
            VStack { // star rating
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 33, height: 31)
                
                Text("\(user.rating, specifier: "%.2f")")
                    .font(.system(size: 12))
            }
                
            Spacer()
                
            }
            .frame(width: 340)
            
            // photos
            ForEach(user.photos ?? [], id: \.self){ url in // optional
                KFImage(url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 340, height: nil)
                    .cornerRadius(12)
                    .padding(.bottom, 10)
            }
            
            // prompts
            
                VStack(alignment: .leading){
                    Text(question)
                        .textCase(.uppercase)
                        .font(.system(size: 12))
                        .padding(.bottom, 5)
                    
                    Text(answer)
                        .font(.custom("BricolageGrotesque-Regular", size: 22))
                }
                .padding(.bottom, 20)
                .frame(width: 340, height: nil)
            
        }
        .padding([.leading, .trailing], 15)
        .padding([.bottom, .top], 15)
        .background(.white)
        .cornerRadius(20)
        
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: mainUser)
    }
}
