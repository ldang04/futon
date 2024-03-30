//
//  Test.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI

struct Test: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
//
//            Image("futon_logo")
//            Image("futon_f")
//            Image("futon_f_yellow")
            
            Text("Test text")
                .foregroundColor(.white)
                .font(.custom("BricolageGrotesque-Regular", size: 25))
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
