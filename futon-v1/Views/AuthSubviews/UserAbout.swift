//
//  UserAbout.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI

struct UserAbout: View {
    @Binding var currentState: Int
    
    var body: some View {
        ZStack {
            Text("User About")
        }
    }
}

struct UserAbout_Previews: PreviewProvider {
    static var previews: some View {
        UserAbout(currentState: .constant(0))
    }
}
