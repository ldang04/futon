//
//  ContentView.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI
import Supabase

struct ContentView: View {
    @State var isLoggedIn = false
    
    init() { // remove tab bar transparent bg
        let client = SupabaseClient(supabaseURL: supabaseUrl, supabaseKey: supabaseKey)
        print("Configured Supabase")
        let transparentAppearence = UITabBarAppearance()
        transparentAppearence.configureWithTransparentBackground() // 🔑
        UITabBar.appearance().standardAppearance = transparentAppearence
    }
    
    var body: some View {
        
        VStack {
            if(isLoggedIn){
                MainTabView()
            } else {
                AuthView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

//TabView components
struct MainTabView: View {
    @State var selectedTab = 0;

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab){
                HomeView()
                    .tag(0)
                
                RequestView(user: mainUser) // @todo: load user from server
                    .tag(1)
                
                CalendarView()
                    .tag(2)
                
                ProfileView(user: mainUser) // @todo: load user from server
                    .tag(3)
            }
            .background(.red)
            
            ZStack {
                HStack {
                    ForEach(TabItems.allCases, id: \.self){ item in
                        Button {
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.icon, isActive: selectedTab == item.rawValue)
                        }
                    }
                }
            }
            .frame(width: 360, height: 60)
            .background(Color("barGray"))
            .cornerRadius(35)
            .padding(.horizontal, 26)
        }
    }
}

enum TabItems: Int, CaseIterable {
    case home = 0
    case request
    case calendar
    case profile
    
    var icon: String {
        switch self {
        case .home:
            return "house"
        case .request:
            return "envelope"
        case .calendar:
            return "calendar.circle"
        case .profile:
            return "person"
        }
    }
}

extension MainTabView{
    func CustomTabItem(imageName: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Text(Image(systemName: isActive ? "\(imageName).fill" : imageName))
                .font(.system(size: 30))
                .foregroundColor(.black)
            
            Spacer()
        }
        .cornerRadius(30)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
