//
//  RequestBox.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI
import Kingfisher

struct RequestBox: View { // @todo - add a reason for the request
    var type: Int
    var request: Request
    var id: String
    
    @State var user = mainUser
    
    @State var viewed = false // @future save conversation status
    
    @State var isShowingProfile = false
    
    var body: some View {
        VStack {
            HStack {
                KFImage(user.pfpURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 50)
                
                VStack(alignment: .leading) {
                    Text("Request from \(user.name)")
                        .font(.custom("BricolageGrotesque-Medium", size: 17))
                    
                    Text("\(user.university) \(String(user.graduationYear))")
                        .font(.custom("BricolageGrotesque-Regular", size: 15))
                    
                }
                
                Spacer()
            }
            
            Text(request.dates)
                .font(.custom("BricolageGrotesque-Regular", size: 30))
                .padding(.bottom, 10)
                        
            Button {
                isShowingProfile = true
            } label: {
                Text("\( type == 0 ? "Pending" : "Tap to View")")
                    .font(.custom("BricolageGrotesque-Medium", size: 17))
                    .padding([.top, .bottom], 7)
                    .padding([.leading, .trailing], 25)
                    .background(type == 0 ? Color.gray : Color("futonNavy"))
                    .cornerRadius(40)
                    .foregroundColor(.white)
            }
            .sheet(isPresented: $isShowingProfile){
                RequestProfile(user: user)
            }
            
            Spacer()
        }
        .onAppear {
            Task {
                user = await getUserWithId(id: id)!
            }
        }
        .padding(15)
        .frame(width: 366, height: 200)
        .background(.white)
        .cornerRadius(20)
    }
}

struct RequestBox_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
//            RequestBox(request: Request)
        }
    }
}
