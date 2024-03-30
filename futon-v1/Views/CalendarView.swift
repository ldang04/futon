//
//  CalendarView.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        ZStack {
            Color("futonLightGray")
                .edgesIgnoringSafeArea(.all)
            
            Image("futon_f")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 430, height: nil)
                .offset(x: 0, y: -40)
                .opacity(0.4)
                .colorMultiply(Color("futonLilac"))
            
            VStack {
                HStack {
                    Text("Upcoming")
                        .font(.custom("BricolageGrotesque-Medium", size: 34))
                        .padding(.leading, 20)
                    
                    Spacer()
                }
                   
                
                Spacer()
            }
            .padding()
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
