//
//  MainView.swift
//  Panic
//
//  Created by Дмитрий Яновский on 18.06.24.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab = "EVENTS"
    private let tabs = ["EVENTS", "RATING", "PROFILE", "SETTINGS"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                Text("EVENTS")
                    .tag("EVENTS")
                
                Text("RATING")
                    .tag("RATING")
                
                ProfileView()
                    .tag("PROFILE")
                  
                
                Text("SETTINGS")
                    .tag("SETTINGS")
                   
            }
            
            HStack(alignment: .top) {
                Spacer()
                ForEach(tabs, id: \.self) { tab in
                    TabBarItem(tab: tab, selectedTab: $selectedTab)
                    Spacer()
                }
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: .black.opacity(0.9), radius: 2, x: 0, y: 0)
            
        }
        .ignoresSafeArea()
    }
}

struct TabBarItem: View {
    let tab: String
    @Binding var selectedTab: String

    var body: some View {
        Button {
            withAnimation {
                selectedTab = tab
            }
        } label: {
            HStack {
                ZStack {
                    if tab == "PROFILE" {
                        Circle()
                            .frame(width: 40, height: 45)
                            .foregroundColor(selectedTab == tab ? .black : .white)
                        Image("PhotoProfile")
                            .resizable()
                            .frame(width: 37, height: 37)
                            .background(.white)
                            .clipShape(Circle())
                    } else {
                        Image(tab)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(selectedTab == tab ? .black : .gray)
                    }
                }
                
                if selectedTab == tab {
                    Text(tab)
                        .bold()
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                }
            }
            .opacity(selectedTab == tab ? 1 : 0.7)
            .padding(.vertical, tab == "PROFILE" ? 0 : 10)
            .padding(.horizontal, tab == "PROFILE" ? 10 : 10)
            .background(selectedTab == tab ? Color.white.opacity(0.01) : Color.clear)
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.3), radius: 2, x: 5, y: 5)
            .fontWeight(.bold)
           
        } 
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
