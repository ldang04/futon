//
//  ChatView.swift
//  futon-v1
//
//  Created by Ruby Chang on 2024/3/31.
//

import SwiftUI
import Kingfisher

struct ChatView: View {
    var user: User
    
    var body: some View {
        ZStack() {
          ZStack() {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 375, height: 86)
              .background(.white)
              .cornerRadius(12)
              .offset(x: 0, y: 0)
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 375, height: 34)
              .cornerRadius(12)
              .offset(x: 0, y: 26)
            HStack(spacing: 0) {

            }
            .padding(EdgeInsets(top: 1, leading: 7, bottom: 1, trailing: 6))
            .frame(width: 24, height: 24)
            .cornerRadius(12)
            .offset(x: 103.50, y: -15)
            .opacity(0.50)
            Text("Write a message...")
              .font(Font.custom("SF Pro Text", size: 12))
              .lineSpacing(18)
              .foregroundColor(Color(red: 0.11, green: 0.10, blue: 0.34))
              .offset(x: -79, y: -18)
              .opacity(0.50)
            ZStack() {

            }
            .frame(width: 24, height: 24)
            .cornerRadius(12)
            .offset(x: -159.50, y: -15)
            .opacity(0.50)
            ZStack() {
              Ellipse()
                .foregroundColor(.clear)
                .frame(width: 40, height: 40)
                .background(Color(red: 0.45, green: 0.49, blue: 1))
                .cornerRadius(12)
                .offset(x: 0, y: 0)
              ZStack() {

              }
              .frame(width: 24, height: 24)
              .background(Color(red: 0.45, green: 0.49, blue: 1))
              .cornerRadius(12)
              .offset(x: 0, y: 0)
            }
            .frame(width: 40, height: 40)
            .offset(x: 151.50, y: -15)
          }
          .frame(width: 375, height: 86)
          .offset(x: 0, y: 369)
          ZStack() {
            Ellipse()
              .foregroundColor(.clear)
              .frame(width: 40, height: 40)
              .background(
                KFImage(user.pfpURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
              )
              .offset(x: 0, y: 0)
            Ellipse()
              .foregroundColor(.clear)
              .frame(width: 12, height: 12)
              .background(Color(red: 0.30, green: 0.89, blue: 0.09))
              .overlay(Ellipse()
              .inset(by: 1)
              .stroke(.white, lineWidth: 1))
              .offset(x: 14, y: 14)
          }
          .frame(width: 40, height: 40)
          .offset(x: -160.50, y: -164)
          VStack(alignment: .leading, spacing: 10) {
            Text("Hi!! Super excited to go to YHack this year. I’ve read on your host profile that you’re headed there too.\nAnything I should know before getting there?\nYour room is super aesthetic btw. ✨")
              .font(Font.custom("SF Pro Text", size: 16))
              .foregroundColor(Color(red: 0.11, green: 0.10, blue: 0.34))
          }
          .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
          .frame(width: 254)
          .background(Color(red: 0.97, green: 0.97, blue: 0.97))
          .cornerRadius(8)
          .offset(x: -5.50, y: -196)
          Text("3/27 2:16pm")
            .font(Font.custom("SF Pro Text", size: 12))
            .lineSpacing(18)
            .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.74))
            .offset(x: 77, y: -120)
          ZStack() {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 393, height: 117)
              .background(Color(red: 0.93, green: 0.93, blue: 0.93))
              .offset(x: 0, y: 0)
            HStack(spacing: 0) {

            }
            .padding(
              EdgeInsets(top: 4.29, leading: 2.71, bottom: 4.29, trailing: 3.14)
            )
            .frame(width: 25.15, height: 24)
            .background(Color(red: 0.93, green: 0.93, blue: 0.93))
            .offset(x: -175.54, y: 21.50)
              Text(user.name)
              .font(Font.custom("Bricolage Grotesque", size: 20).weight(.medium))
              .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
              .offset(x: -90, y: 14.50)
              Text("\(user.university) \(String(user.graduationYear))")
              .font(Font.custom("Bricolage Grotesque", size: 10).weight(.medium))
              .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
              .offset(x: -53, y: 34)
            HStack(spacing: 0) {

            }
            .frame(width: 24, height: 24)
            .background(Color(red: 0.93, green: 0.93, blue: 0.93))
            .offset(x: 153.50, y: -12.50)
          }
          .frame(width: 393, height: 117)
          .offset(x: 0, y: -368.50)
          Ellipse()
            .foregroundColor(.clear)
            .frame(width: 45, height: 45)
            .background(
                KFImage(user.pfpURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            )
            .offset(x: -160, y: -346.50)
        }
        .frame(width: 393, height: 852)
        .background(Color(red: 0.93, green: 0.93, blue: 0.93))
    }
}

#Preview {
    ChatView(user: mainUser)
}
