//
//  UserAbout.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI

struct UserAbout: View {
    @Binding var currentState: Int
    @Binding var university: String
    @Binding var graduationYear: Int
    
    @State var yesSelected = false
    @State var noSelected = false
    @State var allergies = ""
    
    
    @State var clicked1 = false
    @State var clicked2 = false
    @State var clicked3 = false
    @State var clicked4 = false

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
                Text("About You")
                    .font(.custom("BricolageGrotesque-Medium", size: 34))
                    .padding(.bottom, 30)
                VStack(alignment: .leading) {
                    Text("University")
                
                
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.black)
                            .frame(width: 305, height: 34)
                        TextField("", text: $university)
                            .padding(.leading, 20)
                    }
                    .padding(.bottom, 15)

                    Text("Graduation Year")
                    
                    HStack {
                        
                        clickedBtn(clicked: $clicked1, year: 2024)
                        clickedBtn(clicked: $clicked2, year: 2025)
                        clickedBtn(clicked: $clicked3, year: 2026)
                        clickedBtn(clicked: $clicked4, year: 2027)

                    }
                    .padding(.bottom, 10)

                    Text("Allergies")
                
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.black)
                            .frame(width: 305, height: 34)
                        TextField("", text: $allergies)
                            .padding(.leading, 20)
                    }
                    .padding(.bottom, 15)

                }
                .frame(width: 306)
                
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
            }
        }
    }
}

struct clickedBtn: View {
    @Binding var clicked: Bool
    var year : Int
    
    var body: some View {
        Button {
            clicked.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .stroke(clicked ? Color("futonPurple") : .black)
                    .frame(width: 75, height: 34)
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(clicked ? Color("futonPurple") : Color.white.opacity(0))
                    .frame(width: 75, height: 34)
                
                Text(String(year))

            }
        }
        .foregroundColor(clicked ? .white : .black)
    }
}
struct UserAbout_Previews: PreviewProvider {
    static var previews: some View {
        UserAbout(currentState: .constant(0), university: .constant(""), graduationYear: .constant(0))
    }
}
