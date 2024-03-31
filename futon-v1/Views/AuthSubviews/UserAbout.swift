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
                        Button {
                           graduationYear = 2024
                        } label: {
                            ZStack {
                                Text("2024")
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.black)
                                    .frame(width: 75, height: 34)
                            }
                        }
                        .foregroundColor(.black)
                        
                        Button {
                           graduationYear = 2025
                        } label: {
                            ZStack {
                                Text("2025")
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.black)
                                    .frame(width: 75, height: 34)
                            }
                        }
                        .foregroundColor(.black)
                        
                        Button {
                           graduationYear = 2026
                        } label: {
                            ZStack {
                                Text("2026")
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.black)
                                    .frame(width: 75, height: 34)
                            }
                        }
                        .foregroundColor(.black)
                        
                        Button {
                           graduationYear = 2027
                        } label: {
                            ZStack {
                                Text("2027")
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.black)
                                    .frame(width: 75, height: 34)
                            }
                        }
                        .foregroundColor(.black)
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

struct UserAbout_Previews: PreviewProvider {
    static var previews: some View {
        UserAbout(currentState: .constant(0), university: .constant(""), graduationYear: .constant(0))
    }
}
