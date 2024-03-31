//
//  SwipeView.swift
//  futon-v1
//
//  Created by Linh Dang on 3/31/24.
//

import SwiftUI
import CardStack
import Kingfisher
import WrappingHStack

struct SwipeView: View {
    var users: [User]
    
    var body: some View {
        ZStack {
            Color("futonLightGray")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Stays nearby")
                    .font(.custom("BricolageGrotesque-ExtraBold", size: 36))
                    .padding(.top, 30)

                CardStack(
                      direction: LeftRight.direction,
                      data: users,
                      onSwipe: { _, _ in },
                      content: { person, _, _ in
                          CardView(user: person)
                      }
                    )
                .padding(.leading, 11)
            }
            
        }
    }
}

struct CardView: View {
    var user: User

    @State var isPresented = false
    
    var body: some View {
        Button {
            isPresented = true
        }
        label:  {
            VStack {
                HStack {
                    Spacer()
                    
                    KFImage(user.pfpURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110, height: 110)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                              .stroke(.white, lineWidth: 3)
                          }
                        .overlay {
                            Circle()
                              .stroke(Color("futonPurple"), lineWidth: 3)
                              .frame(width: 110, height: 110)
                        }
                    .padding(.top, 40)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.custom("BricolageGrotesque-Medium", size: 22))
                        
                        Text("\(user.university) \(String(user.graduationYear))")
                            .font(.custom("BricolageGrotesque-Regular", size: 16))
                    }
                    
                    Spacer()
                }
                .padding()
                
                HStack {
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
                    .frame(width: 260)
                    
                    VStack { // star rating
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 33, height: 31)
                        
                        Text("\(user.rating, specifier: "%.2f")")
                            .font(.system(size: 12))
                    }
                }
                
                VStack {
                    if(!(user.photos.isEmpty ?? false)){
                        KFImage(user.photos[0])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 330, height: 350)
                    }
                }
                Spacer()
                
            }
            .frame(width: 370, height: 600)
            .background(.white)
        .cornerRadius(10)
        }
        .foregroundColor(.black)
        .sheet(isPresented: $isPresented){
            ProfileView(user: user)
        }
    }
}

#Preview {
    SwipeView(users: userLists)
}
